import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_browser_providers.dart';
import 'package:url_launcher/url_launcher.dart';

class TemplateDetailScreen extends ConsumerWidget {
  final String templateId;

  const TemplateDetailScreen({super.key, required this.templateId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // templateAsync is now AsyncValue<FullScholarshipTemplate>
    final templateAsync = ref.watch(templateDetailProvider(templateId));
    final myApplicationsAsync = ref.watch(myApplicationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: templateAsync.when(
          data: (fullTemplate) => Text(fullTemplate.template.name), // Use fullTemplate.template.name
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Error'),
        ),
      ),
      body: templateAsync.when(
        data: (fullTemplate) {
          final template = fullTemplate.template; // The main template object
          final tasks = fullTemplate.tasks;       // The list of tasks
          final documents = fullTemplate.documents; // The list of documents

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              // --- Header --- (uses the 'template' object)
              Text(template.providerName, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(template.shortDescription ?? 'No description available.', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              if (template.website != null)
                TextButton.icon(
                  icon: const Icon(Iconsax.global),
                  label: const Text('Visit Official Website'),
                  onPressed: () async {
                    final uri = Uri.parse(template.website!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
              const Divider(height: 32),

              // --- Key Info --- (uses the 'template' object)
              Text('Key Information', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildInfoRow(Iconsax.level, 'Study Level', template.studyLevel),
              _buildInfoRow(Iconsax.location, 'Country', template.country ?? 'Not specified'),
              _buildInfoRow(Iconsax.verify, 'Eligibility', template.eligibility ?? 'Not specified'),
              const Divider(height: 32),

              // --- Default Tasks Section --- (uses the 'tasks' list)
              Text('Default Tasks', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              if (tasks.isEmpty)
                const Text('No default tasks specified.')
              else
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: tasks.map((task) => Chip(label: Text(task.label))).toList(),
                ),
              const SizedBox(height: 24),

              // --- Document Checklist Section --- (uses the 'documents' list)
              Text('Document Checklist', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              if (documents.isEmpty)
                const Text('No documents specified.')
              else
                ...documents.map((doc) => ListTile(
                      leading: const Icon(Iconsax.document_text_1, color: AppColors.textSecondary),
                      title: Text(doc.name),
                      dense: true,
                    )),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Could not load details. Error: $err')),
      ),
      bottomNavigationBar: myApplicationsAsync.when(
        data: (apps) {
          final isAdded = apps.any((app) => app.template.id == templateId);

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: isAdded
                  ? TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Iconsax.tick_circle, color: AppColors.success),
                      label: const Text('Already in your applications', style: TextStyle(color: AppColors.success)),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // --- Navigate to the new wizard route ---
                              print("Navigating to customise wizard for template $templateId");
                              context.go('/templates/$templateId/customise');
                            },
                            child: const Text('Customise & Add'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                final newApp = await ref
                                    .read(applicationRepositoryProvider)
                                    .createApplicationFromTemplate(templateId);

                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text('Application created!'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {
                                          ref
                                              .read(applicationRepositoryProvider)
                                              .deleteApplication(newApp.id);
                                        },
                                      ),
                                    ),
                                  );
                                  // Navigate back after a short delay
                                  Future.delayed(const Duration(milliseconds: 500), () {
                                    if (context.mounted) {
                                      context.pop();
                                    }
                                  });
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error creating application: $e')),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Add Now'),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
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
                Text(value, style: const TextStyle(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
