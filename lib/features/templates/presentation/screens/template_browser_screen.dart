import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_filter_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/widgets/template_card.dart';
import 'package:go_router/go_router.dart';

class TemplateBrowserScreen extends ConsumerWidget {
  const TemplateBrowserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the new filteredTemplatesProvider
    final templatesAsync = ref.watch(filteredTemplatesProvider);
    final regionFilter = ref.watch(templateRegionFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discover Scholarships',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // --- SEARCH AND FILTER UI ---
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search by name or provider...',
                      prefixIcon: Icon(Iconsax.search_normal_1),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppColors.surface,
                    ),
                    onChanged: (value) {
                      ref.read(templateSearchQueryProvider.notifier).setSearchQuery(value);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // --- Region Filter Dropdown ---
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: regionFilter,
                    underline: const SizedBox(), // Removes the default underline
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        ref.read(templateRegionFilterProvider.notifier).setFilter(newValue);
                      }
                    },
                    items: <String>['All', 'International', 'Domestic']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // --- LIST OF TEMPLATES ---
          Expanded(
            child: templatesAsync.when(
              data: (templates) {
                if (templates.isEmpty) {
                  return const Center(child: Text('No scholarship templates match your criteria.'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: templates.length,
                    itemBuilder: (context, index) {
                      final templateWithStatus = templates[index];
                      // No more GestureDetector or AbsorbPointer needed here
                      return TemplateCard(
                        template: templateWithStatus.template,
                        isAdded: templateWithStatus.isAdded,
                        onTap: () { // Pass the navigation logic to the card's onTap
                          context.go('/templates/${templateWithStatus.template.id}');
                        },
                        onAdd: () { // The onAdd logic is unchanged
                          ref.read(applicationRepositoryProvider).createApplicationFromTemplate(templateWithStatus.template.id);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${templateWithStatus.template.name} added to your applications!'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                      );
                    },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: ${err.toString()}')),
            ),
          ),
        ],
      ),
    );
  }
}
