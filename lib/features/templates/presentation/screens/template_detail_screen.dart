// lib/features/templates/presentation/screens/template_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/core/models/document_submission_type.dart';

// --- FIX #1: IMPORT THE FILE THAT DEFINES AssembledMilestone ---
import 'package:saku_beasiswa/core/models/full_template_plan.dart'; 

import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/template_browser_providers.dart';
import 'package:url_launcher/url_launcher.dart';


class TemplateDetailScreen extends ConsumerWidget {
  final String templateId;

  const TemplateDetailScreen({super.key, required this.templateId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templateAsync = ref.watch(templateDetailProvider(templateId));

    return Scaffold(
      body: templateAsync.when(
        data: (fullTemplatePlan) {
          final template = fullTemplatePlan.scholarshipTemplate;
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
                        Text(template.providerName, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(template.longDescription ?? template.shortDescription ?? 'No description available.'),
                        if (template.website != null)
                          TextButton.icon(
                            icon: const Icon(Iconsax.global, size: 20),
                            label: const Text('Visit Official Website'),
                            onPressed: () async {
                              final uri = Uri.parse(template.website!);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                          ),
                        const Divider(height: 32),

                        _SectionHeader(title: 'Suggested Timeline'),
                        const SizedBox(height: 8),
                        if (fullTemplatePlan.assembledMilestones.isEmpty)
                          const Text('No timeline defined for this template.')
                        else
                          // --- FIX #2: USE THE CORRECT DATA STRUCTURE ---
                          // We map over the `assembledMilestones` list directly.
                          ...fullTemplatePlan.assembledMilestones.map((assembledMilestone) {
                            // And pass the entire `assembledMilestone` object.
                            return _MilestoneTile(assembledMilestone: assembledMilestone);
                          }),
                        const Divider(height: 32),
                        
                        _SectionHeader(title: 'Document Checklist'),
                        if (fullTemplatePlan.documents.isEmpty)
                          const Text('No documents specified.')
                        else
                          ...fullTemplatePlan.documents.map((doc) => _DocumentTile(document: doc)),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Could not load details. Error: $err\n$stack')),
      ),
      bottomNavigationBar: _BottomActionBar(templateId: templateId),
    );
  }
}

// --- NEW WIDGET for displaying a milestone ---
// --- CORRECTED WIDGET for displaying a milestone ---
class _MilestoneTile extends StatelessWidget {
  // It now takes a single, well-defined object
  final AssembledMilestone assembledMilestone;

  const _MilestoneTile({required this.assembledMilestone});

  @override
  Widget build(BuildContext context) {
    // Unpack the data from the assembledMilestone object
    final milestoneTemplate = assembledMilestone.milestoneTemplate;
    final taskTemplates = assembledMilestone.taskTemplates;
    final link = assembledMilestone.link;

    final duration = link.endDateOffsetDays - link.startDateOffsetDays;
    
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: Text(milestoneTemplate.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Duration: ~${duration + 1} days'),
        leading: CircleAvatar(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          child: Text(link.order.toString()),
        ),
        children: taskTemplates.isEmpty
            ? [const ListTile(title: Text('No specific tasks for this milestone.'))]
            : taskTemplates.map((task) => ListTile( // Use taskTemplates here
                  leading: const Icon(Iconsax.task_square, size: 20),
                  title: Text(task.label), // Access properties of TaskTemplate
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
        // --- THIS IS THE FIX ---
        // We now check the templateId on the UserApplication object itself.
        final isAdded = apps.any((app) => app.application.templateId == templateId);

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
                              // This method is now correct after our repo refactor
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
