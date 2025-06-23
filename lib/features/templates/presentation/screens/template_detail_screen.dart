// lib/features/templates/presentation/screens/template_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_browser_providers.dart';
// Ensure this is the correct provider import
import 'package:url_launcher/url_launcher.dart';

class TemplateDetailScreen extends ConsumerWidget {
  final String templateId;

  const TemplateDetailScreen({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the full template details
    final templateAsync = ref.watch(templateDetailProvider(templateId));
    
    return Scaffold(
      body: templateAsync.when(
        data: (fullTemplate) {
          final template = fullTemplate.template;
          return CustomScrollView(
            slivers: [
              // --- Sliver App Bar for a modern look ---
              SliverAppBar(
                pinned: true,
                stretch: true,
                expandedHeight: 200.0,
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    template.name,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: false,
                  titlePadding: const EdgeInsets.only(left: 60, bottom: 16),
                  background: Container(
                    color: AppColors.primary.withOpacity(0.8),
                    child: const Icon(Iconsax.award, color: Colors.white24, size: 120),
                  ),
                ),
              ),
              // --- Main Content ---
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(template.providerName, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(template.longDescription ?? template.shortDescription ?? 'No description available.', style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(height: 16),
                        if (template.website != null)
                          TextButton.icon(
                            icon: const Icon(Iconsax.global, size: 20),
                            label: const Text('Visit Official Website'),
                            onPressed: () async {
                              final uri = Uri.parse(template.website!);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri, mode: LaunchMode.externalApplication);
                              }
                            },
                          ),
                        const Divider(height: 32),
                        
                        // --- Key Info Section ---
                        _SectionHeader(title: 'Key Information'),
                        _buildInfoRow(context, Iconsax.level, 'Study Level', template.studyLevel),
                        _buildInfoRow(context, Iconsax.location, 'Country', template.country ?? 'Not specified'),
                        _buildInfoRow(context, Iconsax.money_send, 'Funding', template.fundingType ?? 'Not specified'),
                        _buildInfoRow(context, Iconsax.verify, 'Eligibility', template.eligibility ?? 'Not specified'),
                        const Divider(height: 32),
                        
                        // --- Document Checklist Section ---
                        _SectionHeader(title: 'Document Checklist'),
                        if (fullTemplate.documents.isEmpty)
                          const Text('No documents specified.')
                        else
                          ...fullTemplate.documents.map((doc) => ListTile(
                                leading: const Icon(Iconsax.document_text_1, color: AppColors.textSecondary),
                                title: Text(doc.name),
                                dense: true,
                              )),
                        const Divider(height: 32),

                        // --- Default Task Timeline Section ---
                        _SectionHeader(title: 'Suggested Timeline'),
                        if (fullTemplate.tasks.isEmpty)
                          const Text('No default tasks specified.')
                        else
                          ...fullTemplate.tasks.map((task) => ListTile(
                                leading: const Icon(Iconsax.task_square, color: AppColors.textSecondary),
                                title: Text(task.label),
                                subtitle: Text(task.stage ?? 'General Task'),
                                dense: true,
                              )),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Could not load details. Error: $err')),
      ),
      // --- Refactored Bottom Action Bar ---
      bottomNavigationBar: _BottomActionBar(templateId: templateId),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Helper widget for section headers
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Dedicated widget for the bottom action bar for cleanliness
class _BottomActionBar extends ConsumerWidget {
  final String templateId;
  const _BottomActionBar({required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We need to know if this template has been added.
    // The most reliable way is to check our applications list.
    final myApplicationsAsync = ref.watch(myApplicationsProvider);

    return myApplicationsAsync.when(
      data: (apps) {
        final isAdded = apps.any((app) => app.template.id == templateId);

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isAdded
                ? const Chip(
                    avatar: Icon(Iconsax.tick_circle, color: AppColors.success, size: 20),
                    label: Text('Already in your applications'),
                    backgroundColor: AppColors.surface,
                  )
                : Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Navigate to the customization wizard
                            context.go('/templates/$templateId/customise');
                          },
                          child: const Text('Customize First'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Iconsax.flash_1),
                          label: const Text('Quick Add'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            try {
                              final newApp = await ref.read(applicationRepositoryProvider).createApplicationFromTemplate(templateId);
                              if (!context.mounted) return;
                              // Pop back to the browser screen after adding
                              context.pop(); 
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${newApp.customName} added!'),
                                  action: SnackBarAction(label: 'UNDO', onPressed: () {
                                    ref.read(applicationRepositoryProvider).deleteApplication(newApp.id);
                                  }),
                                ),
                              );
                            } catch (e, st) {
                              print('Error Quick Adding: $e\n$st');
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
      // Show nothing while loading or on error
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}