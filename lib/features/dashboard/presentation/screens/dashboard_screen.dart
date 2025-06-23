// lib/features/dashboard/presentation/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:saku_beasiswa/features/dashboard/presentation/widgets/status_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    // Watch our new, refactored providers
    final activeAppsCount = ref.watch(activeApplicationsCountProvider);
    final overdueCount = ref.watch(overdueTasksCountProvider);
    final nextMilestoneAsync = ref.watch(nextMilestoneDeadlineProvider);
    final focusTasksAsync = ref.watch(todaysFocusProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Dashboard', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Invalidate future providers to re-fetch data
          ref.invalidate(todaysFocusProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            // --- Status Overview Section ---
            Row(
              children: [
                activeAppsCount.when(
                  data: (count) => StatusCard(title: 'Active Apps', value: count.toString(), icon: Iconsax.document_text_1, color: AppColors.primary),
                  loading: () => const Expanded(child: StatusCard(title: 'Active Apps', value: '-', icon: Iconsax.document_text_1, color: AppColors.primary)),
                  error: (err, st) => const StatusCard(title: 'Error', value: '!', icon: Iconsax.danger, color: AppColors.error),
                ),
                const SizedBox(width: 16),
                nextMilestoneAsync.when(
                  data: (milestone) {
                    final daysLeft = milestone?.endDate.difference(DateTime.now()).inDays;
                    return StatusCard(title: 'Next Milestone', value: daysLeft != null ? '$daysLeft Days' : '-', icon: Iconsax.calendar_1, color: AppColors.warning);
                  },
                  loading: () => const Expanded(child: StatusCard(title: 'Next Milestone', value: '-', icon: Iconsax.calendar_1, color: AppColors.warning)),
                  error: (err, st) => const StatusCard(title: 'Error', value: '!', icon: Iconsax.danger, color: AppColors.error),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // --- Overdue Tasks Card ---
            overdueCount.when(
              data: (count) => count > 0 
                  ? StatusCard(title: 'Overdue Tasks', value: count.toString(), icon: Iconsax.danger, color: AppColors.error)
                  : const SizedBox.shrink(), // Don't show if there are no overdue tasks
              loading: () => const SizedBox.shrink(),
              error: (err, st) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 32),

            // --- Today's Focus Section ---
            Text("Today's Focus", style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            focusTasksAsync.when(
              data: (tasks) {
                if (tasks.isEmpty) {
                  return const Card(child: ListTile(leading: Icon(Iconsax.coffee, color: AppColors.success), title: Text("All clear!"), subtitle: Text("No urgent tasks for now.")));
                }
                return Column(
                  children: tasks.map((focusTask) {
                    final task = focusTask.task;
                    final app = focusTask.application;
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: const Icon(Iconsax.edit, color: AppColors.primary),
                        title: Text(task.label), // Use .label now
                        subtitle: Text(
                          'For: ${app.customName}\nDue: ${DateFormat.yMMMd().format(task.dueDate)}',
                        ),
                        trailing: Checkbox(value: task.isCompleted, onChanged: (v) {
                          ref.read(applicationRepositoryProvider).updateTaskStatus(task.id, v ?? false).then((_) {
                            ref.invalidate(todaysFocusProvider); // Re-fetch tasks after one is completed
                            ref.invalidate(overdueTasksCountProvider);
                          });
                        }),
                      ),
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Text('Could not load tasks: $err'),
            ),
          ],
        ),
      ),
    );
  }
}