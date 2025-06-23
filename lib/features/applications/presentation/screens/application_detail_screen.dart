// lib/features/applications/presentation/screens/application_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

// No more tabs, just a single screen
class ApplicationDetailScreen extends ConsumerWidget {
  final int applicationId;
  const ApplicationDetailScreen({super.key, required this.applicationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch our new, powerful detail provider
    final appDetailAsync = ref.watch(applicationDetailProvider(applicationId));
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: appDetailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (fullApp) {
          final app = fullApp.application;
          final template = fullApp.template;
          final milestones = fullApp.milestonesWithTasks;
          final completion = ref.watch(applicationCompletionPercentageProvider(applicationId));

          return CustomScrollView(
            slivers: [
              // --- Header ---
              SliverAppBar(
                title: Text(app.customName ?? template.name),
                pinned: true,
              ),
              // --- Main Content ---
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- Progress Section ---
                        Text('Overall Progress', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        completion.when(
                          data: (percent) => LinearProgressIndicator(value: percent, minHeight: 8),
                          loading: () => const LinearProgressIndicator(),
                          error: (_, __) => const Text('Error loading progress'),
                        ),
                        const SizedBox(height: 24),
                        
                        // --- Milestones Section ---
                        Text('Timeline & Tasks', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        if (milestones.isEmpty)
                          const Text('No milestones for this application.')
                        else
                          ...milestones.entries.map((entry) {
                            final milestone = entry.key;
                            final tasks = entry.value;
                            return _MilestoneCard(milestone: milestone, tasks: tasks);
                          }),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}

// --- NEW WIDGET: _MilestoneCard ---
class _MilestoneCard extends ConsumerWidget {
  final UserMilestone milestone;
  final List<UserTask> tasks;
  const _MilestoneCard({required this.milestone, required this.tasks});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTasks = tasks.where((t) => t.isCompleted).length;
    final isMilestoneDone = completedTasks == tasks.length && tasks.isNotEmpty;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(milestone.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Due: ${DateFormat.yMMMMd().format(milestone.endDate)}'),
        leading: Icon(
          isMilestoneDone ? Iconsax.tick_circle : Iconsax.flag,
          color: isMilestoneDone ? AppColors.success : AppColors.primary,
        ),
        initiallyExpanded: true,
        children: tasks.map((task) {
          return CheckboxListTile(
            value: task.isCompleted,
            onChanged: (value) {
              ref.read(applicationRepositoryProvider).updateTaskStatus(task.id, value ?? false);
            },
            title: Text(
              task.label,
              style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null),
            ),
            subtitle: Text('Due: ${DateFormat.yMMMd().format(task.dueDate)}'),
          );
        }).toList(),
      ),
    );
  }
}