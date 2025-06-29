// lib/core/database/repositories/scholarship_template_repository.dart
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/models/full_template_plan.dart'; // Import our new DTO
import 'package:saku_beasiswa/features/profile/data/profile_setup_form_model.dart';

part 'scholarship_template_repository.g.dart';

@Riverpod(keepAlive: true)
ScholarshipTemplateRepository scholarshipTemplateRepository(Ref ref) {
  return ScholarshipTemplateRepository(ref.watch(appDatabaseProvider));
}

class ScholarshipTemplateRepository {
  final AppDatabase _db;
  ScholarshipTemplateRepository(this._db);

  // This method remains simple, just gets the top-level templates for the browser screen.
  Stream<List<ScholarshipTemplate>> watchAllTemplates() {
    return _db.select(_db.scholarshipTemplates).watch();
  }

  // --- THE NEW, POWERFUL METHOD TO ASSEMBLE A PLAN ---
  Future<FullTemplatePlan> getFullTemplatePlanById(String scholarshipTemplateId) async {
    // 1. Fetch the main scholarship template and its documents
    final scholarship = await (_db.select(_db.scholarshipTemplates)..where((t) => t.id.equals(scholarshipTemplateId))).getSingle();
    final documents = await (_db.select(_db.templateDocuments)..where((d) => d.templateId.equals(scholarshipTemplateId))).get();
    
    // 2. Fetch all the links and their associated milestone templates for this scholarship
    final linkQuery = _db.select(_db.scholarshipMilestoneLinks).join([
      innerJoin(_db.milestoneTemplates, _db.milestoneTemplates.id.equalsExp(_db.scholarshipMilestoneLinks.milestoneTemplateId))
    ])..where(_db.scholarshipMilestoneLinks.scholarshipTemplateId.equals(scholarshipTemplateId));

    final milestoneRows = await linkQuery.get();

    final assembledMilestones = <AssembledMilestone>[];

    // 3. For each linked milestone, fetch its corresponding task templates
    for (final row in milestoneRows) {
      final link = row.readTable(_db.scholarshipMilestoneLinks);
      final milestoneTemplate = row.readTable(_db.milestoneTemplates);

      final taskTemplates = await (_db.select(_db.taskTemplates)
            ..where((t) => t.milestoneTemplateId.equals(milestoneTemplate.id)))
          .get();
      
      assembledMilestones.add(AssembledMilestone(
        milestoneTemplate: milestoneTemplate,
        link: link,
        taskTemplates: taskTemplates,
      ));
    }
    
    // 4. Sort the assembled milestones by the order defined in the link table
    assembledMilestones.sort((a, b) => a.link.order.compareTo(b.link.order));
    
    // 5. Return the complete, assembled plan
    return FullTemplatePlan(
      scholarshipTemplate: scholarship,
      documents: documents,
      assembledMilestones: assembledMilestones,
    );
  }

  // We will refactor this later when we implement the matching feature with structured data.
  Future<List<ScholarshipTemplate>> findMatchingTemplates(ProfileSetupFormModel profile) async {
    return _db.select(_db.scholarshipTemplates).get();
  }
}