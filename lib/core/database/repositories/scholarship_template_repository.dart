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
  final AppDatabase db;
  ScholarshipTemplateRepository(this.db);

  // This method remains simple, just gets the top-level templates for the browser screen.
  Stream<List<ScholarshipTemplate>> watchAllTemplates() {
    return (db.select(db.scholarshipTemplates)
          // Only select templates where the 'isActive' column is true.
        ..where((tbl) => tbl.isActive.equals(true)))
        .watch();
  }

  // Fetches all official, reusable milestone templates to display in the library.
  Future<List<MilestoneTemplate>> getMilestoneLibrary() async {
    return (db.select(db.milestoneTemplates)
          ..where((t) => t.isCustom.equals(false))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .get();
  }

  // --- THE NEW, POWERFUL METHOD TO ASSEMBLE A PLAN ---
  Future<FullTemplatePlan> getFullTemplatePlanById(String scholarshipTemplateId) async {
    // 1. Fetch the main scholarship template and its documents
    final scholarship = await (db.select(db.scholarshipTemplates)..where((t) => t.id.equals(scholarshipTemplateId))).getSingle();
    final documents = await (db.select(db.templateDocuments)..where((d) => d.templateId.equals(scholarshipTemplateId))).get();
    
    // 2. Fetch all the links and their associated milestone templates for this scholarship
    final links = await (db.select(db.scholarshipMilestoneLinks).join([
      innerJoin(db.milestoneTemplates, db.milestoneTemplates.id.equalsExp(db.scholarshipMilestoneLinks.milestoneTemplateId))
    ])..where(db.scholarshipMilestoneLinks.scholarshipTemplateId.equals(scholarshipTemplateId))).get();

    final assembledMilestones = <AssembledMilestone>[];

    // 3. For each linked milestone, fetch its corresponding task templates
    for (final row in links) {
      final link = row.readTable(db.scholarshipMilestoneLinks);
      final milestoneTemplate = row.readTable(db.milestoneTemplates);

      final taskTemplates = await (db.select(db.taskTemplates)
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
    return db.select(db.scholarshipTemplates).get();
  }
}