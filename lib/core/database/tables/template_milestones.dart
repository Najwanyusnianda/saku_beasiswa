// lib/core/database/tables/template_milestones.dart
import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/tables/scholarship_templates.dart';

@DataClassName('TemplateMilestone')
class TemplateMilestones extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();

  // The official name, e.g., 'Pendaftaran Seleksi'
  TextColumn get name => text()(); 
  
  // To display them in the correct sequence (1, 2, 3...)
  IntColumn get order => integer()();

  // Defines the date range relative to the final application deadline.
  // A negative value means "before the deadline".
  // Example: "Pendaftaran" is from -30 days to 0 days before the final deadline.
  IntColumn get startDateOffsetDays => integer()(); 
  IntColumn get endDateOffsetDays => integer()();
}