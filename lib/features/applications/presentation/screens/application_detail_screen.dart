// lib/features/applications/presentation/screens/application_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/enums/document_status.dart'; // Import the enum
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/add_edit_milestone_dialog.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/add_edit_task_dialog.dart';
import 'package:saku_beasiswa/features/applications/presentation/widgets/add_edit_document_dialog.dart';

// At the top of the file, outside any class
final hideCompletedMilestonesProvider = StateProvider<bool>((ref) => false);

// Enum to manage milestone states and corresponding UI
enum MilestoneStatus {
  completed(label: 'Completed', color: AppColors.success),
  inProgress(label: 'In Progress', color: AppColors.primary),
  overdue(label: 'Overdue', color: AppColors.error),
  notStarted(label: 'Not Started', color: Colors.grey);

  const MilestoneStatus({required this.label, required this.color});
  final String label;
  final Color color;
}

class ApplicationDetailScreen extends ConsumerWidget {
  final int applicationId;
  const ApplicationDetailScreen({super.key, required this.applicationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDetailAsync = ref.watch(applicationDetailProvider(applicationId));
    final isSaving = ref.watch(isSavingProvider);
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Scaffold(
          body: appDetailAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
            data: (fullApp) {
              final app = fullApp.application;
              final template = fullApp.template;

              final documents = fullApp.documents;
              final completion = ref.watch(applicationCompletionPercentageProvider(applicationId));

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(app.customName ?? template.name),
                    pinned: true,
                    actions: [
                      IconButton(onPressed: () {}, icon: const Icon(Iconsax.more)),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            _SectionHeader(title: 'Overall Progress'),
                            const SizedBox(height: 8),
                            completion.when(
                              data: (percent) => Column(
                                children: [
                                  LinearProgressIndicator(value: percent, minHeight: 8, borderRadius: BorderRadius.circular(4)),
                                  const SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('${(percent * 100).toInt()}% Complete', style: textTheme.bodySmall),
                                  ),
                                ],
                              ),
                              loading: () => const LinearProgressIndicator(),
                              error: (_, __) => const Text('Error loading progress'),
                            ),
                            const SizedBox(height: 32),
                            _SectionHeader(
                              title: 'Timeline & Tasks',
                              action: IconButton(
                                icon: const Icon(Iconsax.add_circle, color: AppColors.primary),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AddEditMilestoneDialog(userApplicationId: applicationId),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
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
                            _SectionHeader(
                              title: 'Document Checklist',
                              action: IconButton(
                                icon: const Icon(Iconsax.add_circle, color: AppColors.primary),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AddEditDocumentDialog(userApplicationId: applicationId),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (documents.isEmpty)
                              const Text('No documents to track. Add one!')
                            else
                              ...documents.map((doc) => _DocumentCard(document: doc)),
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
        if (isSaving)
          const Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isSaving)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}

// --- WIDGETS FOR THE DETAIL SCREEN ---

class _SectionHeader extends StatelessWidget {
  final String title;
  final Widget? action;
  const _SectionHeader({required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        if (action != null) action!,
      ],
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

    if (allMilestones.isEmpty) {
      return const Text('No milestones yet. Add one to start planning!');
    }

    // Filter the milestones based on the toggle's state
    final visibleMilestones = allMilestones.entries.where((entry) {
      if (!hideCompleted) return true; // If not hiding, show everything
      
      final tasks = entry.value;
      final isMilestoneDone = tasks.isNotEmpty && tasks.every((t) => t.isCompleted);
      return !isMilestoneDone; // Only show if NOT done
    });

    if (visibleMilestones.isEmpty && hideCompleted) {
      return const Card(
        child: ListTile(
          leading: Icon(Iconsax.like_1, color: AppColors.success),
          title: Text("All milestones completed!"),
          subtitle: Text("Toggle 'Hide completed' to see them again."),
        ),
      );
    }
    
    return Column(
      children: visibleMilestones.map((entry) => 
        _MilestoneCard(milestone: entry.key, tasks: entry.value)
      ).toList(),
    );
  }
}

class _MilestoneCard extends ConsumerWidget {
  final UserMilestone milestone;
  final List<UserTask> tasks;
  const _MilestoneCard({required this.milestone, required this.tasks});

  // Helper method to determine the milestone's status
  MilestoneStatus _getMilestoneStatus() {
    if (tasks.isEmpty) return MilestoneStatus.notStarted;
    
    final now = DateTime.now();
    final allTasksCompleted = tasks.every((t) => t.isCompleted);

    if (allTasksCompleted) return MilestoneStatus.completed;
    if (milestone.endDate.isBefore(now)) return MilestoneStatus.overdue;
    if (milestone.startDate.isBefore(now)) return MilestoneStatus.inProgress;
    
    return MilestoneStatus.notStarted;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = _getMilestoneStatus();
    final completedTasks = tasks.where((t) => t.isCompleted).length;
    final totalTasks = tasks.length;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: status == MilestoneStatus.completed ? Colors.grey.shade300 : status.color),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: Text(milestone.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        // NEW: Subtitle shows both progress and status
        subtitle: Text('$completedTasks of $totalTasks tasks  •  ${status.label}'),
        leading: Icon(
          status == MilestoneStatus.completed ? Iconsax.tick_circle : Iconsax.flag,
          color: status.color,
          size: 28,
        ),
        trailing: PopupMenuButton(
          icon: const Icon(Iconsax.more),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'edit',
              child: const Text('Edit Milestone'),
              onTap: () => Future.delayed(
                const Duration(milliseconds: 50), // Short delay to allow menu to close
                () => showDialog(
                  context: context,
                  builder: (_) => AddEditMilestoneDialog(
                    userApplicationId: milestone.userApplicationId,
                    milestoneToEdit: milestone,
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: const Text('Delete Milestone', style: TextStyle(color: AppColors.error)),
              onTap: () => ref.read(applicationRepositoryProvider).deleteUserMilestone(milestone.id),
            ),
          ],
        ),
        // NEW: Auto-collapse if the milestone is completed
        initiallyExpanded: status != MilestoneStatus.completed,
        children: [
          // Add a thin progress bar inside the card
          if (totalTasks > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: LinearProgressIndicator(
                value: completedTasks / totalTasks,
                backgroundColor: status.color.withOpacity(0.2),
                color: status.color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ...tasks.map((task) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: task.isCompleted,
                onChanged: (value) {
                  ref.read(applicationRepositoryProvider).updateTaskStatus(task.id, value ?? false);
                },
                title: Text(task.label, style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null)),
                subtitle: Text('Due: ${DateFormat.yMMMd().format(task.dueDate)}'),
                secondary: IconButton(
                  icon: const Icon(Iconsax.edit, size: 20),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AddEditTaskDialog(
                      milestoneId: milestone.id,
                      taskToEdit: task,
                    ),
                  ),
                ),
              )),
          TextButton.icon(
            icon: const Icon(Iconsax.add, size: 20),
            label: const Text('Add Task'),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AddEditTaskDialog(milestoneId: milestone.id),
            ),
          )
        ],
      ),
    );
  }
}

class _DocumentCard extends ConsumerWidget {
  final UserDocument document;
  const _DocumentCard({required this.document});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 16), // Adjusted padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    document.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  )
                ),
                // --- WIRE UP EDIT/DELETE DOCUMENT ---
                PopupMenuButton(
                  icon: const Icon(Iconsax.more, size: 20),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text('Edit Name'),
                      onTap: () => Future.delayed(
                        const Duration(milliseconds: 50),
                        () => showDialog(
                          context: context,
                          builder: (_) => AddEditDocumentDialog(
                            userApplicationId: document.userApplicationId,
                            documentToEdit: document,
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: const Text('Delete', style: TextStyle(color: AppColors.error)),
                      onTap: () => ref.read(applicationRepositoryProvider).deleteUserDocument(document.id),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // --- WIRE UP STATUS CHANGE ---
            SegmentedButton<DocumentStatus>(
              segments: DocumentStatus.values.map((status) => 
                ButtonSegment(value: status, label: Text(status.name.replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}').trim().capitalize()))
              ).toList(),
              selected: {document.status},
              onSelectionChanged: (newSelection) {
                ref.read(applicationRepositoryProvider).updateUserDocumentStatus(document.id, newSelection.first);
              },
              style: SegmentedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                textStyle: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper extension to capitalize the first letter for the UI
extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1)}";
    }
}