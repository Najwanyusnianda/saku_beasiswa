// lib/core/database/tables/template_language_requirements.dart
import 'package:drift/drift.dart';

import 'scholarship_templates.dart';

enum LanguageTestType { toeflIBT, ielts, duolingo, toeic }

@DataClassName('TemplateLanguageRequirement')
class TemplateLanguageRequirements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();
  // Use an enum for the test type
  IntColumn get testType => intEnum<LanguageTestType>()(); 
  RealColumn get minScore => real()();
}
