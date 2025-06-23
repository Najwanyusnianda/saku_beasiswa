// lib/features/templates/presentation/screens/template_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/models/document_submission_type.dart'; // Import for our enum
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_browser_providers.dart';
import 'package:url_launcher/url_launcher.dart';


class TemplateDetailScreen extends ConsumerWidget {
  final String templateId;

  const TemplateDetailScreen({super.key, required this.templateId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This now watches our new provider, returning the richer data model
    final templateAsync = ref.watch(templateDetailProvider(templateId));

    return Scaffold(
      // The body now uses when to handle the async state
      body: templateAsync.when(
        data: (fullTemplateData) {
          final template = fullTemplateData.template;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(template.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  centerTitle: false,
                  titlePadding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- Description Section ---
                        Text(template.providerName, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(template.longDescription ?? template.shortDescription ?? 'No description available.'),
                        if (template.website != null)
                          TextButton.icon(
                            icon: const Icon(Iconsax.global, size: 20),
                            label: const Text('Visit Official Website'),
                            onPressed: () async { /* ... url launcher logic ... */ },
                          ),
                        const Divider(height: 32),

                        // --- NEW: Timeline Section ---
                        _SectionHeader(title: 'Suggested Timeline'),
                        const SizedBox(height: 8),
                        if (fullTemplateData.milestonesWithTasks.isEmpty)
                          const Text('No timeline defined for this template.')
                        else
                          // Build the list of expandable milestones
                          ...fullTemplateData.milestonesWithTasks.entries.map((entry) {
                            final milestone = entry.key;
                            final tasks = entry.value;
                            return _MilestoneTile(milestone: milestone, tasks: tasks);
                          }),
                        const Divider(height: 32),
                        
                        // --- Refactored: Document Checklist ---
                        _SectionHeader(title: 'Document Checklist'),
                        if (fullTemplateData.documents.isEmpty)
                          const Text('No documents specified.')
                        else
                          ...fullTemplateData.documents.map((doc) => _DocumentTile(document: doc)),
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
      // The bottom bar can remain the same for now, as its logic is independent
      bottomNavigationBar: _BottomActionBar(templateId: templateId),
    );
  }
}

// --- NEW WIDGET for displaying a milestone ---
class _MilestoneTile extends StatelessWidget {
  final TemplateMilestone milestone;
  final List<TemplateTask> tasks;

  const _MilestoneTile({required this.milestone, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final duration = milestone.endDateOffsetDays - milestone.startDateOffsetDays;
    
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: Text(milestone.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Duration: ~${duration + 1} days'),
        leading: CircleAvatar(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          child: Text(milestone.order.toString()),
        ),
        children: tasks.isEmpty
            ? [const ListTile(title: Text('No specific tasks for this milestone.'))]
            : tasks.map((task) => ListTile(
                  leading: const Icon(Iconsax.task_square, size: 20),
                  title: Text(task.label),
                  dense: true,
                )).toList(),
      ),
    );
  }
}

// --- NEW WIDGET for displaying a document with its type ---
class _DocumentTile extends StatelessWidget {
  final TemplateDocument document;

  const _DocumentTile({required this.document});
  
  (IconData, String) _getSubmissionTypeInfo() {
    switch (document.submissionType) {
      case DocumentSubmissionType.onlineForm:
        return (Iconsax.keyboard, 'Online Form');
      case DocumentSubmissionType.upload:
        return (Iconsax.document_upload, 'Upload');
    }
  }

  @override
  Widget build(BuildContext context) {
    final (icon, type) = _getSubmissionTypeInfo();
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary),
      title: Text(document.name),
      trailing: Text(type, style: Theme.of(context).textTheme.bodySmall),
      dense: true,
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