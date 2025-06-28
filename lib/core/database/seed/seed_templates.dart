// lib/core/database/seed/seed_templates.dart
import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/models/document_submission_type.dart';

// The main function that orchestrates all seeding
Future<void> seedDatabase(AppDatabase db) async {
  await _clearExistingData(db); // Good practice to start fresh

  // 1. Seed the reusable "Lego blocks" first
  await _seedMilestoneAndTaskTemplates(db);

  // 2. Now, assemble specific scholarship plans using the blocks
  await _seedLpdpScholarship(db);
  await _seedCheveningScholarship(db);
  // Add more scholarships here...
}

Future<void> _clearExistingData(AppDatabase db) async {
  // Clear data in the correct order to respect foreign key constraints
  await db.delete(db.taskTemplates).go();
  await db.delete(db.scholarshipMilestoneLinks).go();
  await db.delete(db.milestoneTemplates).go();
  await db.delete(db.scholarshipTemplates).go();
  await db.delete(db.templateDocuments).go();
}

Future<void> _seedMilestoneAndTaskTemplates(AppDatabase db) async {
  // --- MILESTONE: Planning & Research ---
  final planningId = await db.into(db.milestoneTemplates).insert(
    MilestoneTemplatesCompanion.insert(
      name: 'Planning & Research Prep',
      description: const Value('Initial preparation and research phase'),
      isCustom: const Value(false),
    ),
  );
  await db.batch((batch) {
    batch.insertAll(db.taskTemplates, [
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: planningId, 
        label: 'Research past successful applicants',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(0),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: planningId, 
        label: 'Finalize list of 3 target universities',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(1),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: planningId, 
        label: 'Set a target IELTS/TOEFL score',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(2),
      ),
    ]);
  });

  // --- MILESTONE: Document Gathering ---
  final docsId = await db.into(db.milestoneTemplates).insert(
    MilestoneTemplatesCompanion.insert(
      name: 'Document Gathering',
      description: const Value('Collect and prepare all required documents'),
      isCustom: const Value(false),
    ),
  );
  await db.batch((batch) {
    batch.insertAll(db.taskTemplates, [
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: docsId, 
        label: 'Request official academic transcripts',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(0),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: docsId, 
        label: 'Request 2 letters of recommendation',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(1),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: docsId, 
        label: 'Scan passport and national ID',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(2),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: docsId, 
        label: 'Update your CV/Resume',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(3),
      ),
    ]);
  });
  
  // --- MILESTONE: Essay Writing ---
  final essayId = await db.into(db.milestoneTemplates).insert(
    MilestoneTemplatesCompanion.insert(
      name: 'Essay Writing',
      description: const Value('Draft and refine application essays'),
      isCustom: const Value(false),
    ),
  );
  await db.batch((batch) {
    batch.insertAll(db.taskTemplates, [
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: essayId, 
        label: 'Brainstorm essay topics and outlines',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(0),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: essayId, 
        label: 'Write first draft of all essays',
        defaultOffsetDays: const Value(7),
        displayOrder: const Value(1),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: essayId, 
        label: 'Get essays proofread by a mentor',
        defaultOffsetDays: const Value(14),
        displayOrder: const Value(2),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: essayId, 
        label: 'Finalize and polish all essays',
        defaultOffsetDays: const Value(21),
        displayOrder: const Value(3),
      ),
    ]);
  });

  // --- MILESTONE: Language Test ---
  final langTestId = await db.into(db.milestoneTemplates).insert(
    MilestoneTemplatesCompanion.insert(
      name: 'Language Test (IELTS/TOEFL)',
      description: const Value('Prepare for and complete language proficiency testing'),
      isCustom: const Value(false),
    ),
  );
  await db.batch((batch) {
    batch.insertAll(db.taskTemplates, [
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: langTestId, 
        label: 'Study for the language test',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(0),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: langTestId, 
        label: 'Register for an official test date',
        defaultOffsetDays: const Value(14),
        displayOrder: const Value(1),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: langTestId, 
        label: 'Take the official test',
        defaultOffsetDays: const Value(28),
        displayOrder: const Value(2),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: langTestId, 
        label: 'Receive official score report',
        defaultOffsetDays: const Value(42),
        displayOrder: const Value(3),
      ),
    ]);
  });

  // --- MILESTONE: Final Application Submission ---
  final submissionId = await db.into(db.milestoneTemplates).insert(
    MilestoneTemplatesCompanion.insert(
      name: 'Final Application Submission',
      description: const Value('Complete and submit the scholarship application'),
      isCustom: const Value(false),
    ),
  );
  await db.batch((batch) {
    batch.insertAll(db.taskTemplates, [
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: submissionId, 
        label: 'Fill out the entire online application form',
        defaultOffsetDays: const Value(0),
        displayOrder: const Value(0),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: submissionId, 
        label: 'Upload all required documents',
        defaultOffsetDays: const Value(3),
        displayOrder: const Value(1),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: submissionId, 
        label: 'Pay application fee (if any)',
        defaultOffsetDays: const Value(5),
        displayOrder: const Value(2),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: submissionId, 
        label: 'Perform a final review of the entire application',
        defaultOffsetDays: const Value(7),
        displayOrder: const Value(3),
      ),
      TaskTemplatesCompanion.insert(
        milestoneTemplateId: submissionId, 
        label: 'Submit the application 24 hours before the deadline',
        defaultOffsetDays: const Value(8),
        displayOrder: const Value(4),
      ),
    ]);
  });
}

Future<void> _seedLpdpScholarship(AppDatabase db) async {
  const templateId = 'lpdp_master_2025';

  // Step 1: Create the main ScholarshipTemplate entry
  await db.into(db.scholarshipTemplates).insert(
    ScholarshipTemplatesCompanion.insert(
      id: templateId,
      name: 'LPDP – Master & Doktoral',
      providerName: 'Kemenkeu RI',
      shortDescription: const Value('Beasiswa penuh untuk WNI di universitas terbaik dunia.'),
      longDescription: const Value('LPDP menyediakan beasiswa penuh untuk jenjang Magister dan Doktoral bagi putra-putri terbaik Indonesia untuk mengembangkan pemimpin masa depan.'),
      country: const Value('Global'),
      studyLevel: 'S2,S3',
      fieldOfStudy: const Value('Prioritas Pembangunan Nasional'),
      fundingType: const Value('Full'),
      website: const Value('https://lpdp.kemenkeu.go.id'),
      color: const Value('#0F6B86'),
      author: const Value('Official'),
      isFeatured: const Value(true),
    ),
  );

  // Step 2: Define which milestone blocks this scholarship uses and in what order/timing.
  final planningMilestone = await (db.select(db.milestoneTemplates)..where((t) => t.name.equals('Planning & Research Prep'))).getSingle();
  final docsMilestone = await (db.select(db.milestoneTemplates)..where((t) => t.name.equals('Document Gathering'))).getSingle();
  final essayMilestone = await (db.select(db.milestoneTemplates)..where((t) => t.name.equals('Essay Writing'))).getSingle();
  final langTestMilestone = await (db.select(db.milestoneTemplates)..where((t) => t.name.equals('Language Test (IELTS/TOEFL)'))).getSingle();
  final submissionMilestone = await (db.select(db.milestoneTemplates)..where((t) => t.name.equals('Final Application Submission'))).getSingle();
  
  // Now, create the links using the ScholarshipMilestoneLinks table
  await db.batch((batch) {
    batch.insertAll(db.scholarshipMilestoneLinks, [
      // Link "Planning Prep", order 0, scheduled 7-6 months before deadline
      ScholarshipMilestoneLinksCompanion.insert(
        scholarshipTemplateId: templateId, 
        milestoneTemplateId: planningMilestone.id, 
        order: 0, 
        startDateOffsetDays: -210, 
        endDateOffsetDays: -180
      ),
      // Link "Language Test", order 1, scheduled 6-4 months before deadline
      ScholarshipMilestoneLinksCompanion.insert(
        scholarshipTemplateId: templateId, 
        milestoneTemplateId: langTestMilestone.id, 
        order: 1, 
        startDateOffsetDays: -180, 
        endDateOffsetDays: -120
      ),
      // Link "Document Gathering", order 2, scheduled 4-2 months before deadline
      ScholarshipMilestoneLinksCompanion.insert(
        scholarshipTemplateId: templateId, 
        milestoneTemplateId: docsMilestone.id, 
        order: 2, 
        startDateOffsetDays: -120, 
        endDateOffsetDays: -60
      ),
      // Link "Essay Writing", order 3, scheduled 2-1 months before deadline
      ScholarshipMilestoneLinksCompanion.insert(
        scholarshipTemplateId: templateId, 
        milestoneTemplateId: essayMilestone.id, 
        order: 3, 
        startDateOffsetDays: -60, 
        endDateOffsetDays: -30
      ),
      // Link "Final Submission", order 4, scheduled for the last 30 days
      ScholarshipMilestoneLinksCompanion.insert(
        scholarshipTemplateId: templateId, 
        milestoneTemplateId: submissionMilestone.id, 
        order: 4, 
        startDateOffsetDays: -30, 
        endDateOffsetDays: 0
      ),
    ]);
  });
  
  // Step 3: Seed the documents specific to this scholarship
  await db.batch((batch) {
    batch.insertAll(db.templateDocuments, [
      TemplateDocumentsCompanion.insert(
        templateId: templateId, 
        name: 'Biodata Diri', 
        submissionType: const Value(DocumentSubmissionType.onlineForm)
      ),
      TemplateDocumentsCompanion.insert(
        templateId: templateId, 
        name: 'Kartu Tanda Penduduk (KTP)', 
        submissionType: const Value(DocumentSubmissionType.upload)
      ),
      TemplateDocumentsCompanion.insert(
        templateId: templateId, 
        name: 'Scan Ijazah S1/S2 (Asli atau Legalisir)', 
        submissionType: const Value(DocumentSubmissionType.upload)
      ),
      TemplateDocumentsCompanion.insert(
        templateId: templateId, 
        name: 'Scan Transkrip Nilai S1/S2', 
        submissionType: const Value(DocumentSubmissionType.upload)
      ),
      TemplateDocumentsCompanion.insert(
        templateId: templateId, 
        name: 'Sertifikat Bahasa Asing (opsional)', 
        isOptional: const Value(true), 
        submissionType: const Value(DocumentSubmissionType.upload)
      ),
      TemplateDocumentsCompanion.insert(
        templateId: templateId, 
        name: 'Letter of Acceptance (LoA) Unconditional (jika ada)', 
        isOptional: const Value(true), 
        submissionType: const Value(DocumentSubmissionType.upload)
      ),
      TemplateDocumentsCompanion.insert(
        templateId: templateId, 
        name: 'Surat Rekomendasi', 
        submissionType: const Value(DocumentSubmissionType.upload)
      ),
      TemplateDocumentsCompanion.insert(
        templateId: templateId, 
        name: 'Esai Komitmen kembali ke Indonesia & Rencana Kontribusi', 
        submissionType: const Value(DocumentSubmissionType.upload)
      ),
    ]);
  });
}

// Placeholder for the Chevening seeder
Future<void> _seedCheveningScholarship(AppDatabase db) async {
  // We can implement this later
}