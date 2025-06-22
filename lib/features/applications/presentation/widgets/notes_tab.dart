import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

class NotesTab extends ConsumerStatefulWidget {
  final int applicationId;
  const NotesTab({super.key, required this.applicationId});

  @override
  ConsumerState<NotesTab> createState() => _NotesTabState();
}

class _NotesTabState extends ConsumerState<NotesTab> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill the text field with existing notes when the widget is first built.
    final initialNotes = ref.read(applicationDetailProvider(widget.applicationId)).value?.application.notes;
    _textController.text = initialNotes ?? '';
  }

  @override
  void dispose() {
    // Clean up the controller and the debouncer when the widget is disposed.
    _textController.dispose();
    EasyDebounce.cancel('notes-debouncer');
    super.dispose();
  }

  void _onNoteChanged(String text) {
    // This function will be called on every keystroke.
    // EasyDebounce ensures the database write operation is only triggered
    // after the user has stopped typing for 1 second (1000 ms).
    EasyDebounce.debounce(
      'notes-debouncer', // A unique ID for this debouncer
      const Duration(milliseconds: 1000),
      () => _saveNotes(text),
    );
  }

  Future<void> _saveNotes(String text) async {
    // Call the repository to save the notes.
    await ref.read(applicationRepositoryProvider).updateNotes(widget.applicationId, text);

    // Optional: show a subtle feedback message to the user.
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Notes saved!'),
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // We listen to the provider to rebuild if notes are changed from another device (in the future).
    ref.listen(applicationDetailProvider(widget.applicationId), (_, next) {
      final newNotes = next.value?.application.notes ?? '';
      if (_textController.text != newNotes) {
        _textController.text = newNotes;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _textController,
        onChanged: _onNoteChanged,
        maxLines: null, // Allows the text field to expand vertically
        expands: true, // Fills the available vertical space
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          hintText: 'Jot down your notes, links, or contacts here...',
          border: InputBorder.none,
          filled: true,
          fillColor: AppColors.surface,
        ),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
