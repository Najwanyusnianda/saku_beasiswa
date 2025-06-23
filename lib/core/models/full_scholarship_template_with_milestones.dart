// lib/core/models/full_scholarship_template_with_milestones.dart
import 'package:saku_beasiswa/core/database/app_database.dart';

class FullScholarshipTemplateWithMilestones {
  final ScholarshipTemplate template;
  final List<TemplateDocument> documents;
  // This is the key change: a map of milestones to their tasks
  final Map<TemplateMilestone, List<TemplateTask>> milestonesWithTasks;

  FullScholarshipTemplateWithMilestones({
    required this.template,
    required this.documents,
    required this.milestonesWithTasks,
  });
}
