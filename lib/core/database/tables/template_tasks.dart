// lib/core/database/tables/template_tasks.dart
import 'package:drift/drift.dart';


import 'template_milestones.dart';

// Refactor lib/core/database/tables/template_tasks.dart
@DataClassName('TemplateTask')
class TemplateTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // A task now belongs to a MILESTONE
  IntColumn get milestoneId => integer().references(TemplateMilestones, #id)();
  
  TextColumn get label => text()(); // "Write first draft of essay"
  
  // We can still have an offset within the milestone for finer control
  // e.g., "Submit essay 2 days before milestone ends" -> offsetDays = -2
  IntColumn get offsetDaysFromMilestoneEnd => integer().withDefault(const Constant(0))();

  BoolColumn get isMandatory => boolean().withDefault(const Constant(true))();
}
