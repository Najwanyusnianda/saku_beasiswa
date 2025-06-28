// lib/core/database/tables/task_templates.dart
import 'package:drift/drift.dart';

import 'milestone_templates.dart';

@DataClassName('TaskTemplate')
class TaskTemplates extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  // Reference to the parent milestone template
  IntColumn get milestoneTemplateId => integer().references(MilestoneTemplates, #id)();
  
  TextColumn get label => text()(); // "Practice STAR method answers", "Proofread final essay"
  IntColumn get defaultOffsetDays => integer().withDefault(const Constant(0))(); // Days offset from milestone date
  
  // Optional: Add an order column if you want to control the display order of tasks
  IntColumn get displayOrder => integer().withDefault(const Constant(0))();
  
  // Optional: Add a flag for required tasks
  BoolColumn get isRequired => boolean().withDefault(const Constant(true))();
}
