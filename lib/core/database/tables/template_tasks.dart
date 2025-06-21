import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/tables/scholarship_templates.dart';

@DataClassName('TemplateTask')
class TemplateTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  // This creates a relationship with the ScholarshipTemplates table
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();
  
  TextColumn get label => text()();
  TextColumn get stage => text().nullable()(); // e.g., "Prepare", "Submit"
  IntColumn get offsetDays => integer().nullable()();
  BoolColumn get isMandatory => boolean().withDefault(const Constant(true))();
}
