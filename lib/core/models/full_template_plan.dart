// lib/core/models/full_template_plan.dart
import 'package:saku_beasiswa/core/database/app_database.dart';

/// This class represents a fully assembled milestone, including its generic info and its specific timing for a scholarship
class AssembledMilestone {
  final MilestoneTemplate milestoneTemplate;
  final ScholarshipMilestoneLink link; // Contains order and offset info
  final List<TaskTemplate> taskTemplates;

  const AssembledMilestone({
    required this.milestoneTemplate,
    required this.link,
    required this.taskTemplates,
  });
}

/// This is the main data class that our wizard will use.
/// It represents the complete, assembled plan for a single scholarship template.
class FullTemplatePlan {
  final ScholarshipTemplate scholarshipTemplate;
  final List<TemplateDocument> documents;
  final List<AssembledMilestone> assembledMilestones;

  const FullTemplatePlan({
    required this.scholarshipTemplate,
    required this.documents,
    required this.assembledMilestones,
  });
}
