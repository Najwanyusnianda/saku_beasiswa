// lib/core/database/tables/template_milestones.dart
import 'package:drift/drift.dart';

import 'scholarship_templates.dart';

@DataClassName('TemplateMilestone')
class TemplateMilestones extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();

  // The official name, e.g., 'Pendaftaran Seleksi', 'Seleksi Administrasi'
  TextColumn get name => text()(); 
  
  // To display them in the correct sequence (1, 2, 3...)
  IntColumn get order => integer()();

  // --- The Key to Flexibility ---
  // We define date RANGES as offsets from a single, final deadline.
  // This allows the entire schedule to be shifted for future planning.
  
  // e.g., for "Pendaftaran" (17 Jan - 17 Feb) on a July 15 final deadline:
  // startDateOffset would be approx -180 days
  IntColumn get startDateOffsetDays => integer()(); 
  
  // endDateOffset would be approx -150 days
  IntColumn get endDateOffsetDays => integer()();
}
