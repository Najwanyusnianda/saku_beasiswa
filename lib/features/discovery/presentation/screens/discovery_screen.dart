import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/discovery_notifier.dart';
import '../../application/dtos/scholarship_filter_dto.dart';
import '../../domain/models/scholarship_filter.dart';
import '../widgets/discovery_screen/discovery_search_bar.dart';
import '../widgets/discovery_screen/quick_filter_chips.dart';
import '../widgets/shared/scholarship_card.dart';

/// Main scholarship discovery screen with Instagram-like feed
class DiscoveryScreen extends ConsumerStatefulWidget {
  const DiscoveryScreen({super.key, this.onNavigateToDetail});

  /// Callback for navigation to detail screen
  /// This abstracts away the navigation implementation from the UI
  final void Function(String scholarshipId)? onNavigateToDetail;

  @override
  ConsumerState<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends ConsumerState<DiscoveryScreen> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _filterScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Load initial scholarships
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(discoveryNotifierProvider.notifier).loadScholarships();
    });

    // Setup infinite scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(discoveryNotifierProvider.notifier).loadMoreScholarships();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _filterScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final discoveryState = ref.watch(discoveryNotifierProvider);
    final discoveryNotifier = ref.read(discoveryNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showSortOptions(context),
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () => _showNotifications(context),
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                // Notification badge could go here
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          DiscoverySearchBar(
            initialQuery: discoveryState.filter.searchQuery,
            onSearchChanged: (query) {
              discoveryNotifier.updateSearchQuery(query);
            },
            onFilterTap: () => _showAdvancedFilters(context),
            hasActiveFilters: _hasActiveFilters(discoveryState.filter),
          ),

          // Quick filter chips
          QuickFilterChips(
            filters: QuickFilters.defaultFilters,
            scrollController: _filterScrollController,
            onFilterTap: (filter) {
              discoveryNotifier.toggleQuickFilter(filter);
            },
          ),

          const SizedBox(height: 8),

          // Scholarship feed
          Expanded(
            child:
                discoveryState.isLoading && discoveryState.scholarships.isEmpty
                ? _buildLoadingState()
                : discoveryState.error != null &&
                      discoveryState.scholarships.isEmpty
                ? _buildErrorState(discoveryState.error!)
                : _buildScholarshipFeed(discoveryState.scholarships),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarshipFeed(List<dynamic> scholarships) {
    if (scholarships.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref
            .read(discoveryNotifierProvider.notifier)
            .refreshScholarships();
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: scholarships.length + 1, // +1 for loading indicator
        itemBuilder: (context, index) {
          if (index == scholarships.length) {
            // Loading indicator for pagination
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final scholarship = scholarships[index];
          return ScholarshipCard(
            scholarship: scholarship,
            onTap: () => _navigateToDetail(scholarship.id),
            onSave: () => _toggleSave(scholarship.id),
            onShare: () => _shareScholarship(scholarship),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Finding perfect scholarships for you...'),
        ],
      ),
    );
  }

  Widget _buildErrorState(Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.read(discoveryNotifierProvider.notifier).loadScholarships();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'No scholarships found',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your filters or search terms',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.read(discoveryNotifierProvider.notifier).clearFilters();
            },
            child: const Text('Clear Filters'),
          ),
        ],
      ),
    );
  }

  bool _hasActiveFilters(ScholarshipFilterDto filter) {
    return filter.searchQuery.isNotEmpty ||
        filter.educationLevels.isNotEmpty ||
        filter.targetCountries.isNotEmpty ||
        filter.subjectAreas.isNotEmpty ||
        filter.fundingType != null;
  }

  void _navigateToDetail(String scholarshipId) {
    // Use the abstracted navigation callback
    widget.onNavigateToDetail?.call(scholarshipId);
  }

  void _toggleSave(String scholarshipId) {
    ref
        .read(discoveryNotifierProvider.notifier)
        .toggleSavedStatus(scholarshipId);
  }

  void _shareScholarship(dynamic scholarship) {
    // TODO: Implement share functionality
  }

  void _showSortOptions(BuildContext context) {
    // TODO: Implement sort options bottom sheet
  }

  void _showNotifications(BuildContext context) {
    // TODO: Implement notifications screen
  }

  void _showAdvancedFilters(BuildContext context) {
    // TODO: Implement advanced filters bottom sheet
  }
}
