// lib/core/database/tables/scholarship_milestone_links.dart
import 'package:drift/drift.dart';

import 'scholarship_templates.dart';
import 'milestone_templates.dart';

class ScholarshipMilestoneLinks extends Table {
  // Foreign key to the main scholarship template
  TextColumn get scholarshipTemplateId => text().references(ScholarshipTemplates, #id)();
  
  // Foreign key to the reusable milestone template
  IntColumn get milestoneTemplateId => integer().references(MilestoneTemplates, #id)();
  
  // These columns define the context FOR THIS SPECIFIC SCHOLARSHIP
  IntColumn get order => integer()();
  IntColumn get startDateOffsetDays => integer()();
  IntColumn get endDateOffsetDays => integer()();

  @override
  Set<Column> get primaryKey => {scholarshipTemplateId, milestoneTemplateId};
  
  // Optional: Add a unique constraint on the order within a scholarship
  // to prevent duplicate order values for the same scholarship
  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
    {scholarshipTemplateId, order},
  ];
}
