// lib/core/database/tables/milestone_templates.dart
import 'package:drift/drift.dart';

@DataClassName('MilestoneTemplate')
class MilestoneTemplates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()(); // "Interview Stage", "Document Submission", "Essay Writing"
  TextColumn get description => text().nullable()(); // "The final interview with the scholarship committee."
  
  // A link to a future "Guides" module
  TextColumn get guideId => text().nullable()();
  
  // A flag for generic vs. specific templates
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
}
