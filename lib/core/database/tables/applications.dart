import 'package:drift/drift.dart';
import 'scholarship_templates.dart';

@DataClassName('Application')
class Applications extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Links to the template this application was created from.
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();
  
  // "in_progress", "submitted", "accepted", "rejected"
  TextColumn get status => text().withDefault(const Constant('in_progress'))();
  DateTimeColumn get deadline => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  // User's notes for the application
  TextColumn get notes => text().nullable()();
    // --- NEW COLUMNS FOR PERSONALIZATION ---
  TextColumn get customName => text().nullable()();
  TextColumn get customColor => text().nullable()();
  TextColumn get customIcon => text().nullable()();

}
