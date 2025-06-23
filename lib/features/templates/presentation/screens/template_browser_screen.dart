// lib/features/templates/presentation/screens/template_browser_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_filter_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/template_card.dart';
// NEW IMPORT for the quick preview sheet
import 'package:saku_beasiswa/features/templates/presentation/widgets/template_quick_preview_sheet.dart';

class TemplateBrowserScreen extends ConsumerWidget {
  const TemplateBrowserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover Scholarships',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        // Optional: Add a search icon button here if you want a dedicated search page
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Invalidate providers to refresh data
          ref.invalidate(recommendedTemplatesProvider);
          ref.invalidate(filteredTemplatesProvider);
        },
        child: ListView( // Using ListView for better performance with multiple sections
          padding: const EdgeInsets.only(top: 8),
          children: const [
            // --- "For You" Section ---
            _RecommendedSection(),
            SizedBox(height: 24),

            // --- "Explore All" Section Header ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Explore All',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            
            // --- Search and Filter UI ---
            _SearchAndFilterControls(),
            SizedBox(height: 8),

            // --- "Explore All" List ---
            _AllTemplatesSection(),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET for the "For You" Section ---
class _RecommendedSection extends ConsumerWidget {
  const _RecommendedSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendedAsync = ref.watch(recommendedTemplatesProvider);
    return recommendedAsync.when(
      data: (templates) {
        if (templates.isEmpty) return const SizedBox.shrink(); // Hide if no recommendations
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Perfect For You',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180, // Give the horizontal list a fixed height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: templates.length,
                itemBuilder: (context, index) {
                  final templateWithStatus = templates[index];
                  return SizedBox(
                    width: 300, // Fixed width for horizontal cards
                    child: TemplateCard(
                      template: templateWithStatus.template,
                      isAdded: templateWithStatus.isAdded,
                      // UPDATED: Show quick preview on tap
                      onTap: () => _showQuickPreview(context, templateWithStatus),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => const SizedBox.shrink(), // Don't show error in this section
    );
  }
}

// --- WIDGET for Search and Filter controls ---
class _SearchAndFilterControls extends ConsumerWidget {
  const _SearchAndFilterControls();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regionFilter = ref.watch(templateRegionFilterProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search by name, provider, country...',
          prefixIcon: Icon(Iconsax.search_normal_1, size: 20),
        ),
        onChanged: (value) {
          ref.read(templateSearchQueryProvider.notifier).setSearchQuery(value);
        },
      ),
      // Here you can add your DropdownButton for region filter if needed
    );
  }
}

// --- WIDGET for the "Explore All" List ---
class _AllTemplatesSection extends ConsumerWidget {
  const _AllTemplatesSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(filteredTemplatesProvider);
    return templatesAsync.when(
      data: (templates) {
        if (templates.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(48.0),
            child: Center(child: Text('No scholarships match your criteria.')),
          );
        }
        // Use a non-scrolling ListView inside a parent ListView
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: templates.length,
          itemBuilder: (context, index) {
            final templateWithStatus = templates[index];
            return TemplateCard(
              template: templateWithStatus.template,
              isAdded: templateWithStatus.isAdded,
              // UPDATED: Show quick preview on tap
              onTap: () => _showQuickPreview(context, templateWithStatus),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}

// --- HELPER FUNCTION to show the bottom sheet ---
void _showQuickPreview(BuildContext context, TemplateWithStatus templateWithStatus) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the sheet to take up more screen height
    builder: (context) => TemplateQuickPreviewSheet(
      templateWithStatus: templateWithStatus,
    ),
  );
}