// lib/core/database/seed/seed_templates.dart
import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/models/document_submission_type.dart';

/// The main function to orchestrate all seeding.
/// This is typically called once when the database is created.
Future<void> seedDatabase(AppDatabase db) async {
  // Clear old data to ensure a fresh start during development.
  await _clearAllData(db);

  // 1. Seed all reusable, modular "Lego blocks" first.
  await _seedMilestoneAndTaskTemplates(db);

  // 2. Now, use the blocks to assemble specific scholarship plans.
  await _seedLpdpScholarship(db);
  await _seedCheveningScholarship(db);
  await _seedGenericPlanningTemplate(db);
}

/// Wipes all template-related data. Crucial for development to avoid conflicts.
Future<void> _clearAllData(AppDatabase db) async {
  // Delete in reverse order of creation to respect foreign key constraints.
  await db.delete(db.scholarshipMilestoneLinks).go();
  await db.delete(db.templateDocuments).go();
  await db.delete(db.taskTemplates).go();
  await db.delete(db.milestoneTemplates).go();
  await db.delete(db.scholarshipTemplates).go();
}

/// Creates ALL the reusable milestone and task templates.
Future<void> _seedMilestoneAndTaskTemplates(AppDatabase db) async {
  // --- A. Create all Milestone Templates in one batch ---
  await db.batch((batch) {
    batch.insertAll(db.milestoneTemplates, [
      // Generic Planning Milestones
      MilestoneTemplatesCompanion.insert(name: 'Phase 1: Research & Preparation'),
      MilestoneTemplatesCompanion.insert(name: 'Phase 2: Skill & Document Development'),
      MilestoneTemplatesCompanion.insert(name: 'Phase 3: Application & Submission'),
      // Official, Reusable Milestones
      MilestoneTemplatesCompanion.insert(name: 'Planning & Research', description: const Value('Initial research and university selection phase.')),
      MilestoneTemplatesCompanion.insert(name: 'Document Gathering', description: const Value('Collect and prepare all required documents')),
      MilestoneTemplatesCompanion.insert(name: 'Essay Writing', description: const Value('Draft, review, and finalize all required essays.')),
      MilestoneTemplatesCompanion.insert(name: 'Language Test (IELTS/TOEFL)', description: const Value('Prepare for and take the required language proficiency test.')),
      MilestoneTemplatesCompanion.insert(name: 'Seleksi Administrasi', description: const Value('Official administrative selection by the scholarship provider.')),
      MilestoneTemplatesCompanion.insert(name: 'Tes Bakat Skolastik', description: const Value('Scholastic aptitude test as part of the selection.')),
      MilestoneTemplatesCompanion.insert(name: 'Seleksi Substansi', description: const Value('Substance selection, often including interviews.')),
    ]);
  });

  // --- B. Fetch the IDs of the milestones we just created ---
  final milestones = await db.select(db.milestoneTemplates).get();
  final phase1Id = milestones.firstWhere((m) => m.name == 'Phase 1: Research & Preparation').id;
  final phase2Id = milestones.firstWhere((m) => m.name == 'Phase 2: Skill & Document Development').id;
  final phase3Id = milestones.firstWhere((m) => m.name == 'Phase 3: Application & Submission').id;
  
  // --- C. Create all Task Templates in one batch, linking them to the IDs ---
  await db.batch((batch) {
    batch.insertAll(db.taskTemplates, [
      // Tasks for Phase 1
      TaskTemplatesCompanion.insert(milestoneTemplateId: phase1Id, label: 'Define your study goals and major'),
      TaskTemplatesCompanion.insert(milestoneTemplateId: phase1Id, label: 'Shortlist 5-10 potential universities'),
      // Tasks for Phase 2
      TaskTemplatesCompanion.insert(milestoneTemplateId: phase2Id, label: 'Take a practice language test'),
      TaskTemplatesCompanion.insert(milestoneTemplateId: phase2Id, label: 'Request letters of recommendation'),
      TaskTemplatesCompanion.insert(milestoneTemplateId: phase2Id, label: 'Draft your personal statement'),
      // Tasks for Phase 3
      TaskTemplatesCompanion.insert(milestoneTemplateId: phase3Id, label: 'Write first essay draft'),
      TaskTemplatesCompanion.insert(milestoneTemplateId: phase3Id, label: 'Complete and submit online forms'),
    ]);
  });
}

/// Assembles the Generic Planning Template.
Future<void> _seedGenericPlanningTemplate(AppDatabase db) async {
  const templateId = 'generic_planning_template';
  await db.into(db.scholarshipTemplates).insert(
    ScholarshipTemplatesCompanion.insert(
      id: templateId,
      name: 'Generic 6-Month Plan',
      providerName: 'Saku Beasiswa',
      studyLevel: 'General',
      isActive: const Value(false),
    ),
    mode: InsertMode.insertOrReplace,
  );

  // Fetch IDs within this function to be self-contained
  final milestones = await db.select(db.milestoneTemplates).get();
  final phase1Id = milestones.firstWhere((m) => m.name == 'Phase 1: Research & Preparation').id;
  final phase2Id = milestones.firstWhere((m) => m.name == 'Phase 2: Skill & Document Development').id;
  final phase3Id = milestones.firstWhere((m) => m.name == 'Phase 3: Application & Submission').id;

  await db.batch((batch) {
    batch.insertAll(db.scholarshipMilestoneLinks, [
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: phase1Id, order: 0, startDateOffsetDays: -180, endDateOffsetDays: -120),
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: phase2Id, order: 1, startDateOffsetDays: -120, endDateOffsetDays: -60),
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: phase3Id, order: 2, startDateOffsetDays: -60, endDateOffsetDays: 0),
    ]);
  });
}

/// Assembles the LPDP scholarship plan.
Future<void> _seedLpdpScholarship(AppDatabase db) async {
  const templateId = 'lpdp_2025';
  await db.into(db.scholarshipTemplates).insert(
    ScholarshipTemplatesCompanion.insert(
      id: templateId,
      name: 'LPDP Beasiswa Reguler',
      providerName: 'Kemenkeu RI',
      studyLevel: 'S2/S3',
      isActive: const Value(true),
    ),
    mode: InsertMode.insertOrReplace,
  );

  final milestones = await db.select(db.milestoneTemplates).get();
  final planningId = milestones.firstWhere((m) => m.name == 'Planning & Research').id;
  final adminId = milestones.firstWhere((m) => m.name == 'Seleksi Administrasi').id;
  final tbsId = milestones.firstWhere((m) => m.name == 'Tes Bakat Skolastik').id;
  final substansiId = milestones.firstWhere((m) => m.name == 'Seleksi Substansi').id;

  await db.batch((batch) {
    batch.insertAll(db.scholarshipMilestoneLinks, [
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: planningId, order: 0, startDateOffsetDays: -90, endDateOffsetDays: -60),
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: adminId, order: 1, startDateOffsetDays: -60, endDateOffsetDays: -30),
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: tbsId, order: 2, startDateOffsetDays: -25, endDateOffsetDays: -15),
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: substansiId, order: 3, startDateOffsetDays: -14, endDateOffsetDays: 0),
    ]);
  });
  
  await db.batch((batch) {
    batch.insertAll(db.templateDocuments, [
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'KTP', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Ijazah S1/S2', submissionType: const Value(DocumentSubmissionType.upload)),
    ]);
  });
}

/// Assembles the Chevening scholarship plan.
Future<void> _seedCheveningScholarship(AppDatabase db) async {
  const templateId = 'chevening_2025';
  await db.into(db.scholarshipTemplates).insert(
    ScholarshipTemplatesCompanion.insert(
      id: templateId,
      name: 'Chevening Scholarship',
      providerName: 'UK Government',
      studyLevel: 'S2',
      isActive: const Value(true),
    ),
    mode: InsertMode.insertOrReplace,
  );

  final milestones = await db.select(db.milestoneTemplates).get();
  final planningId = milestones.firstWhere((m) => m.name == 'Planning & Research').id;
  final docsId = milestones.firstWhere((m) => m.name == 'Document Gathering').id;
  final essayId = milestones.firstWhere((m) => m.name == 'Essay Writing').id;
  final substansiId = milestones.firstWhere((m) => m.name == 'Seleksi Substansi').id;

  await db.batch((batch) {
    batch.insertAll(db.scholarshipMilestoneLinks, [
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: planningId, order: 0, startDateOffsetDays: -150, endDateOffsetDays: -90),
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: docsId, order: 1, startDateOffsetDays: -90, endDateOffsetDays: -45),
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: essayId, order: 2, startDateOffsetDays: -60, endDateOffsetDays: -15),
      ScholarshipMilestoneLinksCompanion.insert(scholarshipTemplateId: templateId, milestoneTemplateId: substansiId, order: 3, startDateOffsetDays: -14, endDateOffsetDays: 0),
    ]);
  });
}