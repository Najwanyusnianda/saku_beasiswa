// lib/core/database/tables/template_stages.dart
import 'package:drift/drift.dart';

import 'scholarship_templates.dart';

@DataClassName('TemplateStage')
class TemplateStages extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();
  
  TextColumn get name => text()(); // "Document Preparation", "Testing", "Final Submission"
  IntColumn get order => integer()(); // To display them in the correct sequence (1, 2, 3...)
  
  // This is the key change: each stage has its own offset!
  IntColumn get offsetDaysFromFinalDeadline => integer().nullable()();
}
