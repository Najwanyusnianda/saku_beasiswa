import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/models/scholarship_filter.dart';
import '../domain/models/scholarship_match.dart';
import '../infrastructure/repositories/json_scholarship_repository.dart';

part 'discovery_notifier.g.dart';

/// State for the scholarship discovery screen
class DiscoveryState {
  const DiscoveryState({
    this.scholarships = const [],
    this.filter = const ScholarshipFilter(),
    this.isLoading = false,
    this.hasMore = true,
    this.error,
  });

  final List<ScholarshipCardData> scholarships;
  final ScholarshipFilter filter;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  DiscoveryState copyWith({
    List<ScholarshipCardData>? scholarships,
    ScholarshipFilter? filter,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) {
    return DiscoveryState(
      scholarships: scholarships ?? this.scholarships,
      filter: filter ?? this.filter,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error ?? this.error,
    );
  }
}

/// Notifier for managing scholarship discovery state
/// This is the main business logic controller for the discovery feature
@riverpod
class DiscoveryNotifier extends _$DiscoveryNotifier {
  late final JsonScholarshipRepository _repository;

  @override
  DiscoveryState build() {
    _repository = JsonScholarshipRepository();
    return const DiscoveryState();
  }

  /// Load initial scholarships
  Future<void> loadScholarships() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // TODO: Replace with actual repository call
      final mockScholarships = _generateMockScholarships();
      
      state = state.copyWith(
        scholarships: mockScholarships,
        isLoading: false,
        hasMore: mockScholarships.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load scholarships: $e',
      );
    }
  }

  /// Load more scholarships (pagination)
  Future<void> loadMoreScholarships() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);
    
    try {
      // TODO: Replace with actual repository call with offset
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate loading
      final moreScholarships = _generateMockScholarships(offset: state.scholarships.length);
      
      state = state.copyWith(
        scholarships: [...state.scholarships, ...moreScholarships],
        isLoading: false,
        hasMore: moreScholarships.length >= 20,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load more scholarships: $e',
      );
    }
  }

  /// Apply filter to scholarship results
  Future<void> applyFilter(ScholarshipFilter filter) async {
    state = state.copyWith(filter: filter, isLoading: true);
    
    try {
      // TODO: Replace with actual repository call with filter
      final filteredScholarships = _generateMockScholarships();
      
      state = state.copyWith(
        scholarships: filteredScholarships,
        isLoading: false,
        hasMore: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to filter scholarships: $e',
      );
    }
  }

  /// Search scholarships by query
  Future<void> searchScholarships(String query) async {
    final newFilter = state.filter.copyWith(searchQuery: query);
    await applyFilter(newFilter);
  }

  /// Toggle saved status of a scholarship
  void toggleSavedStatus(String scholarshipId) {
    final updatedScholarships = state.scholarships.map((scholarship) {
      if (scholarship.id == scholarshipId) {
        return scholarship.copyWith(isSaved: !scholarship.isSaved);
      }
      return scholarship;
    }).toList();
    
    state = state.copyWith(scholarships: updatedScholarships);
  }

  /// Update search query and filter results
  void updateSearchQuery(String query) {
    final updatedFilter = state.filter.copyWith(searchQuery: query);
    applyFilter(updatedFilter);
  }

  /// Toggle quick filter
  void toggleQuickFilter(QuickFilter filter) {
    // For now, just update the search - this can be expanded for specific filter types
    if (filter.type == QuickFilterType.all) {
      clearFilters();
    } else {
      // Apply specific filter based on type
      final updatedFilter = _applyQuickFilter(state.filter, filter);
      applyFilter(updatedFilter);
    }
  }

  /// Clear all filters
  void clearFilters() {
    applyFilter(const ScholarshipFilter());
  }

  /// Refresh scholarships (pull to refresh)
  Future<void> refreshScholarships() async {
    await loadScholarships();
  }

  ScholarshipFilter _applyQuickFilter(ScholarshipFilter currentFilter, QuickFilter quickFilter) {
    switch (quickFilter.type) {
      case QuickFilterType.educationLevel:
        return currentFilter.copyWith(
          educationLevels: [quickFilter.value ?? quickFilter.label]
        );
      case QuickFilterType.country:
        return currentFilter.copyWith(
          targetCountries: [quickFilter.value ?? quickFilter.label]
        );
      case QuickFilterType.subject:
        return currentFilter.copyWith(
          subjectAreas: [quickFilter.value ?? quickFilter.label]
        );
      case QuickFilterType.funding:
        return currentFilter.copyWith(
          fundingType: quickFilter.value == 'Full Scholarship' 
              ? FundingTypeFilter.fullFunding 
              : FundingTypeFilter.partialFunding
        );
      case QuickFilterType.deadline:
        return currentFilter.copyWith(
          deadlineFilter: quickFilter.value == '30_days' 
              ? DeadlineFilter.next30Days 
              : DeadlineFilter.next3Months
        );
      case QuickFilterType.all:
        return const ScholarshipFilter();
    }
  }

  /// Clear current error
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Generate mock scholarship data for development
  List<ScholarshipCardData> _generateMockScholarships({int offset = 0}) {
    return List.generate(20, (index) {
      final id = 'scholarship_${offset + index + 1}';
      final matchScore = 0.6 + (index % 4) * 0.1; // Vary between 60-90%
      
      return ScholarshipCardData(
        id: id,
        title: _getMockTitle(index),
        provider: _getMockProvider(index),
        providerCountry: _getMockCountry(index),
        countryFlag: _getMockEmoji(index),
        fundingType: _getMockFundingType(index),
        fundingAmount: _getMockCoverageAmount(index),
        degreeLevel: _getMockDegreeLevels(index).first,
        applicationDeadline: DateTime.now().add(Duration(days: 30 + (index * 10))),
        matchScore: matchScore,
        scholarshipEmoji: '🎓',
        quickTags: _getMockQuickTags(index),
        isSaved: index % 5 == 0, // Every 5th scholarship is saved
      );
    });
  }

  String _getMockTitle(int index) {
    final titles = [
      'Melbourne Global Graduate Scholarship',
      'LPDP Scholarship Program',
      'Fulbright Indonesia Scholarship',
      'Australia Awards Scholarship',
      'Chevening UK Scholarship',
      'DAAD Germany Scholarship',
      'Swedish Institute Scholarship',
      'New Zealand Excellence Awards',
    ];
    return titles[index % titles.length];
  }

  String _getMockProvider(int index) {
    final providers = [
      'University of Melbourne',
      'Indonesian Government',
      'US-Indonesia Fulbright',
      'Australian Government',
      'UK Government',
      'German Government',
      'Swedish Institute',
      'Education New Zealand',
    ];
    return providers[index % providers.length];
  }

  String _getMockCountry(int index) {
    final countries = ['Australia', 'Indonesia', 'United States', 'United Kingdom', 'Germany', 'Sweden', 'New Zealand'];
    return countries[index % countries.length];
  }

  String _getMockFundingType(int index) {
    final types = ['Full Scholarship', 'Partial Funding', 'Tuition Fee Waiver'];
    return types[index % types.length];
  }

  List<String> _getMockDegreeLevels(int index) {
    final levels = [
      ['Master', 'PhD'],
      ['Undergraduate', 'Master'],
      ['Master'],
      ['PhD'],
    ];
    return levels[index % levels.length];
  }

  String _getMockCoverageAmount(int index) {
    final amounts = ['Full Coverage', '\$50,000/year', '\$30,000/year', 'Tuition + Living'];
    return amounts[index % amounts.length];
  }

  String _getMockEmoji(int index) {
    final emojis = ['🇦🇺', '🇮🇩', '🇺🇸', '🇬🇧', '🇩🇪', '🇸🇪', '🇳🇿'];
    return emojis[index % emojis.length];
  }

  List<String> _getMockQuickTags(int index) {
    final quickTagSets = [
      ['Full Funding', 'No GPA Limit'],
      ['Government Backed'],
      ['Research Focus', 'Full Funding'],
      ['Leadership Track'],
    ];
    return quickTagSets[index % quickTagSets.length];
  }
}
