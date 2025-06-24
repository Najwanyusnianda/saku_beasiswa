import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

class AddEditDocumentDialog extends ConsumerStatefulWidget {
  final int userApplicationId;
  final UserDocument? documentToEdit;

  const AddEditDocumentDialog({
    super.key,
    required this.userApplicationId,
    this.documentToEdit,
  });

  @override
  ConsumerState<AddEditDocumentDialog> createState() => _AddEditDocumentDialogState();
}

class _AddEditDocumentDialogState extends ConsumerState<AddEditDocumentDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  bool get _isEditing => widget.documentToEdit != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.documentToEdit?.name ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  
  void _save() async {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(isSavingProvider.notifier).start();
      final repo = ref.read(applicationRepositoryProvider);
      
      try {
        if (_isEditing) {
          final updatedDocument = widget.documentToEdit!.copyWith(
            name: _nameController.text,
          );
          await repo.updateUserDocument(updatedDocument);
        } else {
          final newDocument = UserDocumentsCompanion(
            userApplicationId: drift.Value(widget.userApplicationId),
            name: drift.Value(_nameController.text),
          );
          await repo.addUserDocument(newDocument);
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
      title: Text(_isEditing ? 'Edit Document' : 'Add Document'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Document Name'),
          validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
          autofocus: true,
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
