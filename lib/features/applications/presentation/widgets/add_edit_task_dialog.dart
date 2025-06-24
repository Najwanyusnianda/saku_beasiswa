import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

class AddEditTaskDialog extends ConsumerStatefulWidget {
  final int milestoneId;
  final UserTask? taskToEdit; // If this is not null, we are in "Edit" mode

  const AddEditTaskDialog({
    super.key,
    required this.milestoneId,
    this.taskToEdit,
  });

  @override
  ConsumerState<AddEditTaskDialog> createState() => _AddEditTaskDialogState();
}

class _AddEditTaskDialogState extends ConsumerState<AddEditTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late DateTime _dueDate;
  bool get _isEditing => widget.taskToEdit != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.taskToEdit?.label ?? '');
    _dueDate = widget.taskToEdit?.dueDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
    );
    if (pickedDate != null) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }
  
  void _save() async {
    if (_formKey.currentState?.validate() ?? false) {
      // 1. Set loading state to TRUE
      ref.read(isSavingProvider.notifier).start();
      
      final repo = ref.read(applicationRepositoryProvider);
      
      try {
        if (_isEditing) {
          final updatedTask = widget.taskToEdit!.copyWith(
            label: _titleController.text,
            dueDate: _dueDate,
          );
          await repo.updateUserTask(updatedTask); // use await
        } else {
          final newTask = UserTasksCompanion(
            userMilestoneId: drift.Value(widget.milestoneId),
            label: drift.Value(_titleController.text),
            dueDate: drift.Value(_dueDate),
          );
          await repo.addUserTask(newTask); // use await
        }
        
        // If successful, close the dialog
        if(mounted) Navigator.of(context).pop();

      } catch (e) {
        // Show an error if something goes wrong
        if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      } finally {
        // 3. ALWAYS set loading state to FALSE when done
        if(mounted) ref.read(isSavingProvider.notifier).stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the saving state
    final isSaving = ref.watch(isSavingProvider);

    return AlertDialog(
      title: Text(_isEditing ? 'Edit Task' : 'Add New Task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Task Name'),
              validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              autofocus: true,
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Due Date'),
              subtitle: Text(DateFormat.yMMMMd().format(_dueDate)),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: isSaving ? null : () => Navigator.of(context).pop(), child: const Text('Cancel')),
        // Show a progress indicator inside the button when saving
        ElevatedButton(
          onPressed: isSaving ? null : _save,
          child: isSaving ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Save'),
        ),
      ],
    );
  }
}
