// lib/features/applications/presentation/screens/application_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/enums/document_status.dart';
import 'package:saku_beasiswa/features/applications/domain/milestone_status.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/add_edit_task_dialog.dart';

import 'package:saku_beasiswa/features/applications/domain/milestone_extensions.dart';

final hideCompletedMilestonesProvider = StateProvider<bool>((ref) => false);

class ApplicationDetailScreen extends ConsumerWidget {
  final int applicationId;
  const ApplicationDetailScreen({super.key, required this.applicationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDetailAsync = ref.watch(applicationDetailProvider(applicationId));
    final isSaving = ref.watch(isSavingProvider);

    return Stack(
      children: [
        Scaffold(
          body: appDetailAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
            data: (fullApp) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(fullApp.application.customName ?? fullApp.template.name),
                    pinned: true,
                    actions: [
                      // --- THE MAIN "EDIT PLAN" BUTTON ---
                      IconButton(
                        icon: const Icon(Iconsax.edit),
                        tooltip: 'Edit Plan',
                        onPressed: () {
                          // TODO: This will navigate to the wizard in edit mode.
                          // We need to create this route and wizard logic later.
                          // For now, it can show a placeholder.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Navigate to Edit Wizard... (not implemented yet)')),
                          );
                          // Example future navigation:
                          // context.go('/applications/$applicationId/edit');
                        },
                      ),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      // --- (Today's Focus and Progress sections can be added here) ---
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            // --- Simplified Header (no action button) ---
                            _SectionHeader(title: 'Timeline & Tasks'),
                            SwitchListTile.adaptive(
                              title: const Text('Hide completed milestones'),
                              value: ref.watch(hideCompletedMilestonesProvider),
                              onChanged: (value) => ref.read(hideCompletedMilestonesProvider.notifier).state = value,
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            const SizedBox(height: 8),
                            _MilestoneList(application: fullApp),
                            const SizedBox(height: 32),
                            // --- Simplified Header (no action button) ---
                            _SectionHeader(title: 'Document Checklist'),
                            const SizedBox(height: 16),
                            _DocumentList(documents: fullApp.documents),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              );
            },
          ),
        ),
        if (isSaving) const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

// --- REFACTORED WIDGETS ---

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class _MilestoneList extends ConsumerWidget {
  final FullUserApplication application;
  const _MilestoneList({required this.application});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideCompleted = ref.watch(hideCompletedMilestonesProvider);
    final allMilestones = application.milestonesWithTasks;
    
    // --- Determine which milestone is "Current" ---
    final now = DateTime.now();
    UserMilestone? currentMilestone;
    for (final entry in allMilestones.entries) {
      final milestone = entry.key;
      final isDone = entry.value.isNotEmpty && entry.value.every((t) => t.isCompleted);
      if (!isDone && (milestone.startDate.isBefore(now) || milestone.startDate.isAtSameMomentAs(now))) {
        currentMilestone = milestone;
        break;
      }
    }

    final visibleMilestones = allMilestones.entries.where((entry) {
      if (!hideCompleted) return true;
      final isMilestoneDone = entry.value.isNotEmpty && entry.value.every((t) => t.isCompleted);
      return !isMilestoneDone;
    });

    if (visibleMilestones.isEmpty) {
      return const Text('No milestones to show.');
    }
    
    return Column(
      children: visibleMilestones.map((entry) {
        final milestone = entry.key;
        final tasks = entry.value;
        final isCurrent = milestone.id == currentMilestone?.id;

        // Render a different card based on whether it's the current one
        return isCurrent 
          ? _CurrentMilestoneCard(milestone: milestone, tasks: tasks)
          : _CollapsedMilestoneCard(milestone: milestone, tasks: tasks);
      }).toList(),
    );
  }
}

// --- NEW: A dedicated card for the CURRENTLY active milestone ---
class _CurrentMilestoneCard extends ConsumerWidget {
  final UserMilestone milestone;
  final List<UserTask> tasks;
  const _CurrentMilestoneCard({required this.milestone, required this.tasks});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = milestone.getStatus(tasks);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: status.color, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            Row(
              children: [
                Icon(Iconsax.flag, color: status.color, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(milestone.name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      Text('Due: ${DateFormat.yMMMMd().format(milestone.endDate)} • ${status.label}'),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            // Task List
            if (tasks.isEmpty)
              const Text('No tasks for this milestone.')
            else
              ...tasks.map((task) => CheckboxListTile(
                    value: task.isCompleted,
                    onChanged: (value) => ref.read(applicationRepositoryProvider).updateTaskStatus(task.id, value ?? false),
                    title: Text(task.label),
                  )),
            const SizedBox(height: 8),
            // --- The ONLY "Add" button left on the screen ---
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                icon: const Icon(Iconsax.add, size: 20),
                label: const Text('Add Task'),
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AddEditTaskDialog(milestoneId: milestone.id),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// --- NEW: A compact card for PAST or FUTURE milestones ---
class _CollapsedMilestoneCard extends StatelessWidget {
  final UserMilestone milestone;
  final List<UserTask> tasks;
  const _CollapsedMilestoneCard({required this.milestone, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final status = milestone.getStatus(tasks);
    final completedTasks = tasks.where((t) => t.isCompleted).length;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: Colors.grey.shade100,
      child: ListTile(
        leading: Icon(
          status == MilestoneStatus.completed ? Iconsax.tick_circle : Iconsax.calendar_1,
          color: status.color,
        ),
        title: Text(milestone.name, style: TextStyle(
          decoration: status == MilestoneStatus.completed ? TextDecoration.lineThrough : null,
        )),
        subtitle: Text(status.label),
        trailing: Text('$completedTasks/${tasks.length}'),
      ),
    );
  }
}

// --- Simplified Document List and Card ---
class _DocumentList extends StatelessWidget {
  final List<UserDocument> documents;
  const _DocumentList({required this.documents});
  
  @override
  Widget build(BuildContext context) {
    if (documents.isEmpty) return const Text('No documents to track.');
    return Column(
      children: documents.map((doc) => _DocumentCard(document: doc)).toList(),
    );
  }
}

class _DocumentCard extends ConsumerWidget {
  final UserDocument document;
  const _DocumentCard({required this.document});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This widget is now simpler, without the "more" button
    return Card(
      // ... same style as before
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(document.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SegmentedButton<DocumentStatus>(
              segments: DocumentStatus.values.map((s) => ButtonSegment(value: s, label: Text(s.name.capitalize()))).toList(),
              selected: {document.status},
              onSelectionChanged: (selection) => ref.read(applicationRepositoryProvider).updateUserDocumentStatus(document.id, selection.first),
            ),
          ],
        ),
      ),
    );
  }
}


// // --- HELPER FUNCTION and EXTENSION ---
// MilestoneStatus _getMilestoneStatus(UserMilestone milestone, List<UserTask> tasks) {
//   if (tasks.isNotEmpty && tasks.every((t) => t.isCompleted)) return MilestoneStatus.completed;
//   final now = DateTime.now();
//   if (milestone.endDate.isBefore(now)) return MilestoneStatus.overdue;
//   if (milestone.startDate.isBefore(now)) return MilestoneStatus.inProgress;
//   return MilestoneStatus.notStarted;
// }

extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}