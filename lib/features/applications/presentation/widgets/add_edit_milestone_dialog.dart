import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

class AddEditMilestoneDialog extends ConsumerStatefulWidget {
  final int userApplicationId;
  final UserMilestone? milestoneToEdit;

  const AddEditMilestoneDialog({
    super.key,
    required this.userApplicationId,
    this.milestoneToEdit,
  });

  @override
  ConsumerState<AddEditMilestoneDialog> createState() => _AddEditMilestoneDialogState();
}

class _AddEditMilestoneDialogState extends ConsumerState<AddEditMilestoneDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late DateTime _startDate;
  late DateTime _endDate;
  bool get _isEditing => widget.milestoneToEdit != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.milestoneToEdit?.name ?? '');
    _startDate = widget.milestoneToEdit?.startDate ?? DateTime.now();
    _endDate = widget.milestoneToEdit?.endDate ?? DateTime.now().add(const Duration(days: 7));
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickDateRange() async {
    final pickedRange = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
    );
    if (pickedRange != null) {
      setState(() {
        _startDate = pickedRange.start;
        _endDate = pickedRange.end;
      });
    }
  }

  void _save() async {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(isSavingProvider.notifier).start();
      final repo = ref.read(applicationRepositoryProvider);

      try {
        if (_isEditing) {
          final updatedMilestone = widget.milestoneToEdit!.copyWith(
            name: _nameController.text,
            startDate: _startDate,
            endDate: _endDate,
          );
          await repo.updateUserMilestone(updatedMilestone);
        } else {
          final newMilestone = UserMilestonesCompanion(
            userApplicationId: drift.Value(widget.userApplicationId),
            name: drift.Value(_nameController.text),
            startDate: drift.Value(_startDate),
            endDate: drift.Value(_endDate),
          );
          await repo.addUserMilestone(newMilestone);
        }
        if (mounted) Navigator.of(context).pop();
      } catch (e) {
        if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      } finally {
        if (mounted) ref.read(isSavingProvider.notifier).stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSaving = ref.watch(isSavingProvider);

    return AlertDialog(
      title: Text(_isEditing ? 'Edit Milestone' : 'Add New Milestone'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Milestone Name'),
              validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              autofocus: true,
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Date Range'),
              subtitle: Text('${DateFormat.yMMMd().format(_startDate)} - ${DateFormat.yMMMd().format(_endDate)}'),
              trailing: const Icon(Icons.calendar_month),
              onTap: _pickDateRange,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: isSaving ? null : () => Navigator.of(context).pop(), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: isSaving ? null : _save,
          child: isSaving ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Save'),
        ),
      ],
    );
  }
}
