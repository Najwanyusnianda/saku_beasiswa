import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

// Ubah menjadi ConsumerWidget karena kita tidak lagi butuh state untuk TabController
class ApplicationDetailScreen extends ConsumerWidget {
  final int applicationId;

  const ApplicationDetailScreen({super.key, required this.applicationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appAsync = ref.watch(applicationDetailProvider(applicationId));
    final tasksAsync = ref.watch(applicationTasksProvider(applicationId));
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: appAsync.when(
          data: (app) => Text(app.application.customName ?? app.template.name),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Error'),
        ),
      ),
      body: appAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error loading application: $err')),
        data: (app) {
          return tasksAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error loading tasks: $err')),
            data: (tasks) {
              // --- Logic Perhitungan Progress ---
              final totalTasks = tasks.length;
              final completedTasks = tasks.where((t) => t.status == 'completed').length;
              final progress = totalTasks > 0 ? completedTasks / totalTasks : 0.0;

              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // --- SECTION 1: HEADER & PROGRESS ---
                  Text(
                    app.application.customName ?? app.template.name,
                    style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Deadline: ${DateFormat.yMMMMd().format(app.application.deadline)}',
                    style: textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(4),
                          backgroundColor: AppColors.outline.withOpacity(0.5),
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text('${(progress * 100).toStringAsFixed(0)}%', style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$completedTasks of $totalTasks tasks completed',
                    style: textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                  ),
                  const Divider(height: 40),

                  // --- SECTION 2: TASK CATEGORIES (diambil dari RequirementsTab) ---
                  _buildTaskCategories(context, ref, tasks),
                  
                  const Divider(height: 40),

                  // --- SECTION 3: NOTES (diambil dari NotesTab) ---
                   TextFormField(
                    initialValue: app.application.notes,
                    decoration: const InputDecoration(
                      labelText: 'My Notes',
                      hintText: 'Add any notes, links, or contacts here...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    onChanged: (value) {
                      // Simple debounce to avoid saving on every keystroke
                      // In a real app, a more robust solution might be needed
                      Future.delayed(const Duration(seconds: 1), () {
                        ref.read(applicationRepositoryProvider).updateNotes(applicationId, value);
                      });
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  // --- WIDGET HELPER UNTUK MENAMPILKAN TASK BERDASARKAN KATEGORI ---
  Widget _buildTaskCategories(BuildContext context, WidgetRef ref, List<Task> tasks) {
    if (tasks.isEmpty) {
      return const Center(child: Text('No requirements specified for this application.'));
    }

    final groupedTasks = groupBy(tasks, (Task task) => task.category);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedTasks.entries.map((entry) {
        final category = entry.key;
        final categoryTasks = entry.value;
        final completed = categoryTasks.where((t) => t.status == 'completed').length;
        
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          clipBehavior: Clip.antiAlias,
          child: ExpansionTile(
            title: Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('$completed of ${categoryTasks.length} completed'),
            initiallyExpanded: true,
            children: categoryTasks.map((task) {
              final isCompleted = task.status == 'completed';
              final bool hasDueDate = task.dueDate != null;

              return Dismissible(
                key: ValueKey(task.id),
                direction: DismissDirection.endToStart,
                onDismissed: (_) { /* ... (logic tidak berubah) ... */ },
                background: Container( /* ... (logic tidak berubah) ... */ ),
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: isCompleted,
                  onChanged: (value) => ref.read(applicationRepositoryProvider).updateTaskStatus(task.id, value ?? false),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: isCompleted ? TextDecoration.lineThrough : null,
                      // Jika belum ada tanggal, buat teks menjadi sedikit redup
                      color: hasDueDate 
                          ? (isCompleted ? AppColors.textTertiary : AppColors.textPrimary)
                          : AppColors.textSecondary,
                    ),
                  ),
                  // --- LOGIC UTAMA UNTUK UX-2 ADA DI SINI ---
                  subtitle: hasDueDate
                    ? Text('Due: ${DateFormat.yMMMd().format(task.dueDate!)}', style: const TextStyle(color: AppColors.warning))
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: ActionChip(
                          label: const Text('Set date'),
                          avatar: const Icon(Iconsax.calendar_add, size: 16),
                          onPressed: () {
                            // Memanggil fungsi yang sama dengan icon di sebelah kanan
                            _showDateEditBottomSheet(context, ref, task);
                          },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.zero,
                        ),
                      ),
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
      }).toList(),
    );
  }

  // --- Kita perlu memindahkan _showDateEditBottomSheet ke dalam class ApplicationDetailScreen ---
  void _showDateEditBottomSheet(BuildContext context, WidgetRef ref, Task task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => _DateEditSheet(
        task: task,
        onSave: (newDate, shouldCascade) {
          ref.read(applicationRepositoryProvider).updateTaskDueDate(
            task.id,
            newDate,
            cascade: shouldCascade,
          );
          Navigator.of(ctx).pop();
        },
      ),
    );
  }
}


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
    _cascadeChanges = true;
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
          ListTile(
            leading: const Icon(Iconsax.calendar_1),
            title: const Text('Due Date'),
            subtitle: Text(
              _selectedDate == null ? 'Not Set' : DateFormat.yMMMMd().format(_selectedDate!),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: _pickDate,
          ),
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
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _selectedDate == null
                      ? null
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