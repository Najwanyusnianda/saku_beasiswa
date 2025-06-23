// lib/core/database/tables/template_gpa_requirements.dart
import 'package:drift/drift.dart';

import 'scholarship_templates.dart';

@DataClassName('TemplateGpaRequirement')
class TemplateGpaRequirements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();
  TextColumn get studyLevel => text()(); // "S2", "S3", etc.
  RealColumn get minGpa => real()();
}
