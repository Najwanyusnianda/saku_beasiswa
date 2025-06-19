// lib/features/applications/presentation/widgets/requirements_tab.dart

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

class RequirementsTab extends ConsumerWidget {
  final int applicationId;
  const RequirementsTab({super.key, required this.applicationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(applicationTasksProvider(applicationId));

    return tasksAsync.when(
      data: (tasks) {
        if (tasks.isEmpty) {
          return const Center(child: Text('No requirements specified for this application.'));
        }

        // Group tasks by category using the `collection` package.
        final groupedTasks = groupBy(tasks, (Task task) => task.category);

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: groupedTasks.length,
          itemBuilder: (context, index) {
            final category = groupedTasks.keys.elementAt(index);
            final categoryTasks = groupedTasks[category]!;

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              clipBehavior: Clip.antiAlias,
              child: ExpansionTile(
                title: Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
                initiallyExpanded: true, // Keep all groups open by default
                children: categoryTasks.map((task) {
                  final isCompleted = task.status == 'completed';
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        color: isCompleted ? AppColors.textTertiary : AppColors.textPrimary,
                      ),
                    ),
                    value: isCompleted,
                    onChanged: (bool? value) {
                      if (value != null) {
                        // Call repository method to update the task status
                        ref.read(applicationRepositoryProvider).updateTaskStatus(task.id, value);
                      }
                    },
                    secondary: isCompleted
                      ? const Icon(Iconsax.tick_circle, color: AppColors.success)
                      : const Icon(Iconsax.info_circle, color: AppColors.warning),
                  );
                }).toList(),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: ${err.toString()}')),
    );
  }
}