// // lib/features/applications/presentation/widgets/add_task_dialog.dart

// import 'package:drift/drift.dart' as drift ;
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:saku_beasiswa/core/database/app_database.dart';
// import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
// //import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';

// class AddTaskDialog extends ConsumerStatefulWidget {
//   final int applicationId;
//   const AddTaskDialog({super.key, required this.applicationId});

//   @override
//   ConsumerState<AddTaskDialog> createState() => _AddTaskDialogState();
// }

// class _AddTaskDialogState extends ConsumerState<AddTaskDialog> {
//   final _titleController = TextEditingController();
//   String _selectedCategory = 'Other';
//   DateTime? _selectedDueDate;

//   final List<String> _categories = ['Personal', 'Academic', 'Financial', 'Essay', 'Interview', 'Other'];

//   @override
//   void dispose() {
//     _titleController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickDate() async {
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: _selectedDueDate ?? DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         _selectedDueDate = pickedDate;
//       });
//     }
//   }

//   void _saveTask() {
//     if (_titleController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a title for the task.')),
//       );
//       return;
//     }
//     final newTask = TasksCompanion.insert(
//       applicationId: widget.applicationId,
//       title: _titleController.text,
//       category: drift.Value(_selectedCategory),
//       dueDate: drift.Value(_selectedDueDate),
//     );

//     ref.read(applicationRepositoryProvider).addTask(newTask);
//     Navigator.of(context).pop(); // Close the dialog
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Add New Task'),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(labelText: 'Task Title'),
//               autofocus: true,
//             ),
//             const SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               value: _selectedCategory,
//               decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
//               items: _categories.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
//               onChanged: (value) {
//                 if (value != null) {
//                   setState(() {
//                     _selectedCategory = value;
//                   });
//                 }
//               },
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     _selectedDueDate == null
//                         ? 'No due date set'
//                         : 'Due: ${DateFormat.yMMMd().format(_selectedDueDate!)}',
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: _pickDate,
//                   child: const Text('Set Date'),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: const Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: _saveTask,
//           child: const Text('Save Task'),
//         ),
//       ],
//     );
//   }
// }