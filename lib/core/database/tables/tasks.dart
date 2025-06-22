// lib/core/database/tables/tasks.dart
import 'package:drift/drift.dart';
import 'applications.dart';

@DataClassName('Task')
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Links to the application this task belongs to.
  IntColumn get applicationId => integer().references(Applications, #id)();

  TextColumn get title => text()();
  // "pending", "completed"
  TextColumn get status => text().withDefault(const Constant('pending'))();
  // Optional due date for a specific task
  DateTimeColumn get dueDate => dateTime().nullable()();
  // Category for grouping tasks
  TextColumn get category => text().withDefault(const Constant('Other'))();
}
