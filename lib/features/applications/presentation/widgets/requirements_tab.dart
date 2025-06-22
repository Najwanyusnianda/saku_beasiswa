// lib/features/applications/presentation/widgets/requirements_tab.dart

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

class RequirementsTab extends ConsumerWidget {
  final int applicationId;
  const RequirementsTab({super.key, required this.applicationId});

  // --- NEW METHOD TO SHOW THE BOTTOM SHEET (UX-1) ---
  void _showDateEditBottomSheet(BuildContext context, WidgetRef ref, Task task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to resize with the keyboard
      builder: (ctx) {
        // Use a StatefulWidget to manage the state within the bottom sheet
        return _DateEditSheet(
          task: task,
          onSave: (newDate, shouldCascade) {
            // Call the repository with the cascade flag
            ref.read(applicationRepositoryProvider).updateTaskDueDate(
              task.id,
              newDate,
              cascade: shouldCascade,
            );
            Navigator.of(ctx).pop(); // Close the sheet
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(applicationTasksProvider(applicationId));

    return tasksAsync.when(
      data: (tasks) {
        if (tasks.isEmpty) {
          return const Center(child: Text('No requirements yet. Add one!'));
        }

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
                initiallyExpanded: true,
                children: categoryTasks.map((task) {
                  final isCompleted = task.status == 'completed';

                  // The final, combined widget for each task row
                  return Dismissible(
                    key: ValueKey(task.id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) {
                      ref.read(applicationRepositoryProvider).deleteTask(task.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${task.title} deleted')),
                      );
                    },
                    background: Container(
                      color: AppColors.error,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Iconsax.trash, color: Colors.white),
                    ),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isCompleted,
                      onChanged: (bool? value) {
                        if (value != null) {
                          ref.read(applicationRepositoryProvider).updateTaskStatus(task.id, value);
                        }
                      },
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: isCompleted ? TextDecoration.lineThrough : null,
                          color: isCompleted ? AppColors.textTertiary : AppColors.textPrimary,
                        ),
                      ),
                      subtitle: task.dueDate != null
                          ? Text('Due: ${DateFormat.yMMMd().format(task.dueDate!)}', style: const TextStyle(color: AppColors.warning))
                          : const Text('No due date set'),
                      // The secondary widget is now the icon button
                      secondary: IconButton(
                        icon: const Icon(Iconsax.calendar_edit, color: AppColors.textSecondary),
                        tooltip: 'Edit Due Date',
                        onPressed: () => _showDateEditBottomSheet(context, ref, task),
                      ),
                    ),
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

// 1. The StatefulWidget (This was the missing piece)
class _DateEditSheet extends StatefulWidget {
  final Task task;
  final Function(DateTime newDate, bool shouldCascade) onSave;

  const _DateEditSheet({required this.task, required this.onSave});

  @override
  State<_DateEditSheet> createState() => _DateEditSheetState();
}

class _DateEditSheetState extends State<_DateEditSheet> {
  late DateTime? _selectedDate;
  late bool _cascadeChanges;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.task.dueDate;
    _cascadeChanges = true; // Default to cascading
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, MediaQuery.of(context).viewInsets.bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Edit Due Date',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(widget.task.title, style: const TextStyle(color: AppColors.textSecondary)),
          const SizedBox(height: 24),

          // --- Date Picker Tile ---
          ListTile(
            leading: const Icon(Iconsax.calendar_1),
            title: const Text('Due Date'),
            subtitle: Text(
              _selectedDate == null ? 'Not Set' : DateFormat.yMMMMd().format(_selectedDate!),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: _pickDate,
          ),

          // --- Cascade Switch ---
          SwitchListTile(
            title: const Text('Cascade changes'),
            subtitle: const Text('Automatically shift dates of later tasks.'),
            value: _cascadeChanges,
            onChanged: (newValue) {
              setState(() {
                _cascadeChanges = newValue;
              });
            },
          ),
          const SizedBox(height: 24),

          // --- Save Button ---
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _selectedDate == null
                      ? null // Disable button if no date is selected
                      : () => widget.onSave(_selectedDate!, _cascadeChanges),
                  child: const Text('Save Date'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}