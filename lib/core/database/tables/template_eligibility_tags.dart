// lib/core/database/tables/template_eligibility_tags.dart
import 'package:drift/drift.dart';

import 'scholarship_templates.dart';

@DataClassName('TemplateEligibilityTag')
class TemplateEligibilityTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();
  // A unique tag, e.g., 'is_wni', 'requires_loa', 'age_limit_35'
  TextColumn get tag => text().unique()();
}
