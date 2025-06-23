// lib/core/database/tables/template_tasks.dart
import 'package:drift/drift.dart';
// NEW IMPORT: We now need to reference TemplateMilestones
import 'package:saku_beasiswa/core/database/tables/template_milestones.dart';

@DataClassName('TemplateTask')
class TemplateTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // --- MAJOR CHANGE ---
  // REMOVE the old templateId, stage, and offsetDays columns.
  // A task now belongs to a MILESTONE.
  IntColumn get milestoneId => integer().references(TemplateMilestones, #id)();
  
  TextColumn get label => text()(); // "Write first draft of essay"
  
  // An optional offset WITHIN the milestone's date range.
  // e.g., "Submit essay 2 days before milestone ends" -> offset = -2
  IntColumn get offsetDaysFromMilestoneEnd => integer().withDefault(const Constant(0))();

  BoolColumn get isMandatory => boolean().withDefault(const Constant(true))();
}