// lib/features/templates/presentation/widgets/template_quick_preview_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_filter_provider.dart';

class TemplateQuickPreviewSheet extends ConsumerWidget {
  final TemplateWithStatus templateWithStatus;

  const TemplateQuickPreviewSheet({
    super.key,
    required this.templateWithStatus,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final template = templateWithStatus.template;
    final isAdded = templateWithStatus.isAdded;
    final textTheme = Theme.of(context).textTheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.6, // Start at 60% of screen height
      minChildSize: 0.4,
      maxChildSize: 0.9, // Can be dragged up to 90%
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Handle to indicate draggable
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    // --- Header ---
                    Text(template.name, style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(template.providerName, style: textTheme.titleMedium?.copyWith(color: AppColors.textSecondary)),
                    const SizedBox(height: 16),
                    Text(template.shortDescription ?? 'No description available.', style: textTheme.bodyLarge),
                    const Divider(height: 32),

                    // --- Key Info (Essential Only) ---
                    _buildInfoRow(context, Iconsax.level, 'Study Level', template.studyLevel),
                    _buildInfoRow(context, Iconsax.location, 'Country', template.country ?? 'Any'),
                    _buildInfoRow(context, Iconsax.money_send, 'Funding', template.fundingType ?? 'Varies'),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              // --- ACTION BUTTONS ---
              if (isAdded)
                const Chip(
                  avatar: Icon(Iconsax.tick_circle, color: AppColors.success, size: 20),
                  label: Text('Already added to your applications'),
                  backgroundColor: AppColors.surface,
                )
              else
                Column(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Iconsax.flash_1),
                      label: const Text('Quick Add'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        // The "Quick Add" flow
                        final newApp = await ref.read(applicationRepositoryProvider).createApplicationFromTemplate(template.id);
                        if (!context.mounted) return;
                        context.pop(); // Close the bottom sheet
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${template.name} added!'),
                            behavior: SnackBarBehavior.floating,
                            action: SnackBarAction(label: 'UNDO', onPressed: () {
                              ref.read(applicationRepositoryProvider).deleteApplication(newApp.id);
                            }),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // The "Customize" flow
                              context.pop(); // Close sheet first
                              context.go('/templates/${template.id}/customise');
                            },
                            child: const Text('Customize'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                               // The "View Details" flow
                              context.pop(); // Close sheet first
                              context.go('/templates/${template.id}');
                            },
                            child: const Text('View Full Details'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildInfoRow(BuildContext context, IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 16),
          Text('$title: ', style: Theme.of(context).textTheme.bodyMedium),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
