// lib/core/database/repositories/scholarship_template_repository.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:saku_beasiswa/features/profile/data/profile_setup_form_model.dart';
// NEW AND CORRECT IMPORT for our data class
import 'package:saku_beasiswa/core/models/full_scholarship_template_with_milestones.dart';

part 'scholarship_template_repository.g.dart';

// --- DELETED ---
// The old FullScholarshipTemplate class is no longer needed.
// We are now using FullScholarshipTemplateWithMilestones.

class ScholarshipTemplateRepository {
  final AppDatabase _db;
  ScholarshipTemplateRepository(this._db);

  // This method is fine, it just fetches the top-level templates.
  Stream<List<ScholarshipTemplate>> watchAllTemplates() {
    return _db.select(_db.scholarshipTemplates).watch();
  }

  // This method is also fine for now. We will implement its logic later
  // when we build the structured matching feature.
  Future<List<ScholarshipTemplate>> findMatchingTemplates(ProfileSetupFormModel profile) async {
    return _db.select(_db.scholarshipTemplates).get();
  }

  // --- DELETED ---
  // The old getFullTemplateById method is now incorrect and removed.

  // --- CORRECTED & CONFIRMED METHOD ---
  // This is the method we wrote previously. It correctly fetches the template,
  // its milestones, and the tasks associated with each milestone.
  Future<FullScholarshipTemplateWithMilestones> getFullTemplateWithMilestones(String templateId) async {
    // 1. Fetch the main template and its documents
    final template = await (_db.select(_db.scholarshipTemplates)..where((t) => t.id.equals(templateId))).getSingle();
    final documents = await (_db.select(_db.templateDocuments)..where((d) => d.templateId.equals(templateId))).get();

    // 2. Fetch all milestones for the template, in order
    final milestones = await (_db.select(_db.templateMilestones)
          ..where((m) => m.templateId.equals(templateId))
          ..orderBy([(m) => OrderingTerm(expression: m.order)]))
        .get();
    
    // 3. For each milestone, fetch its tasks
    final milestonesWithTasks = <TemplateMilestone, List<TemplateTask>>{};
    for (final milestone in milestones) {
      final tasks = await (_db.select(_db.templateTasks)
            ..where((t) => t.milestoneId.equals(milestone.id)))
          .get();
      milestonesWithTasks[milestone] = tasks;
    }
    
    // 4. Return the combined data class
    return FullScholarshipTemplateWithMilestones(
      template: template,
      documents: documents,
      milestonesWithTasks: milestonesWithTasks,
    );
  }
}

@Riverpod(keepAlive: true) // Keep the repository alive throughout the app's lifecycle
ScholarshipTemplateRepository scholarshipTemplateRepository(ScholarshipTemplateRepositoryRef ref) {
  return ScholarshipTemplateRepository(ref.watch(appDatabaseProvider));
}