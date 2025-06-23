// lib/core/database/seed/seed_templates.dart
import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
// NEW IMPORT for our enum
import 'package:saku_beasiswa/core/models/document_submission_type.dart';

// The main seedTemplates function remains the same
Future<void> seedTemplates(AppDatabase db) async {
  // Seed functions will handle their own cleanup
  await _seedLPDP(db);
  await _seedChevening(db);
  await _seedFulbright(db);
  await _seedAAS(db);
  await _seedKOICA(db);
}

// --- REFACTORED LPDP SEED FUNCTION ---
Future<void> _seedLPDP(AppDatabase db) async {
    const templateId = 'lpdp_master_2025';
    await db.customStatement('DELETE FROM template_tasks WHERE milestone_id IN (SELECT id FROM template_milestones WHERE template_id = ?);', [templateId]);
    await db.customStatement('DELETE FROM template_milestones WHERE template_id = ?;', [templateId]);
  await db.customStatement('DELETE FROM template_documents WHERE template_id = ?;', [templateId]);
    await db.customStatement('DELETE FROM scholarship_templates WHERE id = ?;', [templateId]);
    // 1. Seed Template Utama (without the complex string fields)
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
          mode: InsertMode.insertOrReplace,
        );
        
    // (We will add the structured requirements for matching later, focus on timeline first)

    // 2. Seed Milestones (Tahapan)
    // The offsets are based on the example timeline. The final "Pendaftaran" day is our "day 0".
    // All other dates are relative to that.
    final pendaftaranId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
      templateId: templateId, name: 'Pendaftaran Seleksi', order: 1, 
      startDateOffsetDays: -31, // 17 Jan is ~31 days before 17 Feb
      endDateOffsetDays: 0    // 17 Feb is our anchor date
    ));
    final seleksiAdminId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
      templateId: templateId, name: 'Seleksi Administrasi', order: 2,
      startDateOffsetDays: 1,   // 18 Feb is 1 day after
      endDateOffsetDays: 17   // 6 Mar is ~17 days after
    ));
    final pengumumanAdminId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
      templateId: templateId, name: 'Pengumuman Hasil Seleksi Administrasi', order: 3,
      startDateOffsetDays: 18, // 7 Mar is 18 days after
      endDateOffsetDays: 18
    ));
    final sanggahId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
      templateId: templateId, name: 'Pengajuan Sanggah', order: 4,
      startDateOffsetDays: 19, // 8 Mar
      endDateOffsetDays: 21   // 10 Mar
    ));
    final seleksiBakatId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
      templateId: templateId, name: 'Seleksi Bakat Skolastik', order: 5,
      startDateOffsetDays: 38, // 27 Mar
      endDateOffsetDays: 42   // 31 Mar
    ));
    await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
      templateId: templateId, name: 'Pengumuman Hasil Seleksi Bakat Skolastik', order: 6,
      startDateOffsetDays: 47, // 5 Apr
      endDateOffsetDays: 47
    ));
    final seleksiSubstansiId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
      templateId: templateId, name: 'Seleksi Substansi', order: 7,
      startDateOffsetDays: 52, // 10 Apr
      endDateOffsetDays: 108  // 31 Mei
    ));
    await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
      templateId: templateId, name: 'Pengumuman Hasil Seleksi Substansi', order: 8,
      startDateOffsetDays: 113, // 5 Jun
      endDateOffsetDays: 113
    ));

    // 3. Seed Personal Tasks, now linked to the Milestones
    await db.batch((batch) {
      batch.insertAll(db.templateTasks, [
        // --- Tasks for the "Pendaftaran Seleksi" Milestone ---
        TemplateTasksCompanion.insert(milestoneId: pendaftaranId, label: 'Tulis draf pertama esai kontribusi'),
        TemplateTasksCompanion.insert(milestoneId: pendaftaranId, label: 'Minta feedback esai dari mentor/dosen'),
        TemplateTasksCompanion.insert(milestoneId: pendaftaranId, label: 'Finalisasi esai kontribusi'),
        TemplateTasksCompanion.insert(milestoneId: pendaftaranId, label: 'Siapkan & scan semua dokumen wajib'),
        TemplateTasksCompanion.insert(milestoneId: pendaftaranId, label: 'Isi formulir Biodata Diri online'),
        TemplateTasksCompanion.insert(milestoneId: pendaftaranId, label: 'Minta Surat Rekomendasi'),
        TemplateTasksCompanion.insert(milestoneId: pendaftaranId, label: 'Submit aplikasi final', offsetDaysFromMilestoneEnd: const Value(-1)), // Suggest submitting 1 day before the milestone ends
      
        // --- Tasks for the "Seleksi Administrasi" Milestone (mostly waiting) ---
        TemplateTasksCompanion.insert(milestoneId: seleksiAdminId, label: 'Cek email & portal LPDP secara berkala'),

        // --- Tasks for "Seleksi Bakat Skolastik" ---
        TemplateTasksCompanion.insert(milestoneId: seleksiBakatId, label: 'Pelajari contoh soal TPA dan logika'),
        TemplateTasksCompanion.insert(milestoneId: seleksiBakatId, label: 'Latihan simulasi tes online'),
        TemplateTasksCompanion.insert(milestoneId: seleksiBakatId, label: 'Pastikan koneksi internet stabil untuk hari-H'),

        // --- Tasks for "Seleksi Substansi" (Wawancara) ---
        TemplateTasksCompanion.insert(milestoneId: seleksiSubstansiId, label: 'Siapkan poin-poin penting untuk wawancara'),
        TemplateTasksCompanion.insert(milestoneId: seleksiSubstansiId, label: 'Latihan wawancara dengan teman atau mentor'),
        TemplateTasksCompanion.insert(milestoneId: seleksiSubstansiId, label: 'Siapkan pakaian formal untuk wawancara'),
        TemplateTasksCompanion.insert(milestoneId: seleksiSubstansiId, label: 'Cek jadwal dan lokasi/link wawancara'),
      ]);
    });
    
    // 4. Seed Documents with their submission type
    await db.batch((batch) {
      batch.insertAll(db.templateDocuments, [
        TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Biodata Diri', submissionType: const Value(DocumentSubmissionType.onlineForm)),
        TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Kartu Tanda Penduduk (KTP)', submissionType: const Value(DocumentSubmissionType.upload)),
        TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Scan Ijazah S1/S2 (Asli atau Legalisir)', submissionType: const Value(DocumentSubmissionType.upload)),
        TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Scan Transkrip Nilai S1/S2', submissionType: const Value(DocumentSubmissionType.upload)),
        TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Sertifikat Bahasa Asing (opsional)', isOptional: const Value(true), submissionType: const Value(DocumentSubmissionType.upload)),
        TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Letter of Acceptance (LoA) Unconditional (jika ada)', isOptional: const Value(true), submissionType: const Value(DocumentSubmissionType.upload)),
        TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Surat Rekomendasi', submissionType: const Value(DocumentSubmissionType.upload)),
        TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Esai Komitmen kembali ke Indonesia & Rencana Kontribusi', submissionType: const Value(DocumentSubmissionType.upload)),
      ]);
    });
}

// --- Chevening Seed Function ---
Future<void> _seedChevening(AppDatabase db) async {
  const templateId = 'chevening_master_2025';

    await db.customStatement('DELETE FROM template_tasks WHERE milestone_id IN (SELECT id FROM template_milestones WHERE template_id = ?);', [templateId]);
    await db.customStatement('DELETE FROM template_milestones WHERE template_id = ?;', [templateId]);
  await db.customStatement('DELETE FROM template_documents WHERE template_id = ?;', [templateId]);
    await db.customStatement('DELETE FROM scholarship_templates WHERE id = ?;', [templateId]);

  await db.into(db.scholarshipTemplates).insert(
    ScholarshipTemplatesCompanion.insert(
      id: templateId,
      name: 'Chevening Scholarship',
      providerName: 'UK Government',
      shortDescription: const Value('Global scholarship for future leaders to study in the UK.'),
      country: const Value('UK'),
      studyLevel: 'S2',
      fundingType: const Value('Full'),
      website: const Value('https://www.chevening.org/'),
      color: const Value('#E84D1F'),
      author: const Value('Official'),
      isFeatured: const Value(true),
    ),
    mode: InsertMode.insertOrReplace,
  );

  final appId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Application Window', order: 1, 
    startDateOffsetDays: -90, // Opens ~3 months before deadline
    endDateOffsetDays: 0      // Deadline is anchor
  ));
  final interviewId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Interviews', order: 2,
    startDateOffsetDays: 120, // ~4 months after deadline
    endDateOffsetDays: 150    // Lasts for a month
  ));
  await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Results Announcement', order: 3,
    startDateOffsetDays: 180, // ~June, 2 months after interviews
    endDateOffsetDays: 180
  ));

  await db.batch((batch) {
    batch.insertAll(db.templateTasks, [
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Apply to 3 eligible UK university courses'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Prepare and write 4 leadership essays'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Secure 2 professional/academic references'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Submit Chevening online application', offsetDaysFromMilestoneEnd: const Value(-2)),
      TemplateTasksCompanion.insert(milestoneId: interviewId, label: 'Prepare for interview questions'),
    ]);
  });

  await db.batch((batch) {
    batch.insertAll(db.templateDocuments, [
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'University Transcripts & Degree Certificate', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'References (2)', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Unconditional UK University Offer', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Passport/ID Card', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Four Themed Essays', submissionType: const Value(DocumentSubmissionType.onlineForm)),
    ]);
  });
}

// --- Fulbright Seed Function ---
Future<void> _seedFulbright(AppDatabase db) async {
  const templateId = 'fulbright_master_2025';

    await db.customStatement('DELETE FROM template_tasks WHERE milestone_id IN (SELECT id FROM template_milestones WHERE template_id = ?);', [templateId]);
    await db.customStatement('DELETE FROM template_milestones WHERE template_id = ?;', [templateId]);
  await db.customStatement('DELETE FROM template_documents WHERE template_id = ?;', [templateId]);
      await db.customStatement('DELETE FROM scholarship_templates WHERE id = ?;', [templateId]);

  await db.into(db.scholarshipTemplates).insert(
    ScholarshipTemplatesCompanion.insert(
      id: templateId,
      name: 'Fulbright Scholarship (Indonesia)',
      providerName: 'AMINEF / U.S. Department of State',
      shortDescription: const Value('Promoting mutual understanding between the US and Indonesia.'),
      country: const Value('USA'),
      studyLevel: 'S2,S3',
      fundingType: const Value('Full'),
      website: const Value('https://www.aminef.or.id/'),
      color: const Value('#00487B'),
      author: const Value('Official'),
      isFeatured: const Value(true),
    ),
    mode: InsertMode.insertOrReplace,
  );

  final appId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Application Period', order: 1, 
    startDateOffsetDays: -120, // Opens ~4 months before deadline
    endDateOffsetDays: 0      // Deadline is anchor (e.g., Feb 15)
  ));
  final interviewId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Interviews for Shortlisted Candidates', order: 2,
    startDateOffsetDays: 60, // ~2 months after deadline
    endDateOffsetDays: 75
  ));
  await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Final Announcement', order: 3,
    startDateOffsetDays: 105, // ~June
    endDateOffsetDays: 105
  ));

  await db.batch((batch) {
    batch.insertAll(db.templateTasks, [
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Take TOEFL/IELTS test'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Draft Study/Research Objective'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Request letters of reference'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Complete and submit application form', offsetDaysFromMilestoneEnd: const Value(-1)),
      TemplateTasksCompanion.insert(milestoneId: interviewId, label: 'Practice interview based on study objective'),
    ]);
  });

  await db.batch((batch) {
    batch.insertAll(db.templateDocuments, [
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Completed Application Form', submissionType: const Value(DocumentSubmissionType.onlineForm)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Copy of latest degree transcript', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Copy of official ITP TOEFL/IELTS score report', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Two letters of reference', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'CV/Resume', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Study/Research Objective Essay', submissionType: const Value(DocumentSubmissionType.upload)),
    ]);
  });
}

// --- AAS Seed Function ---
Future<void> _seedAAS(AppDatabase db) async {
  const templateId = 'aas_master_2025';

    await db.customStatement('DELETE FROM template_tasks WHERE milestone_id IN (SELECT id FROM template_milestones WHERE template_id = ?);', [templateId]);
    await db.customStatement('DELETE FROM template_milestones WHERE template_id = ?;', [templateId]);
      await db.customStatement('DELETE FROM template_documents WHERE template_id = ?;', [templateId]);
      await db.customStatement('DELETE FROM scholarship_templates WHERE id = ?;', [templateId]);

  await db.into(db.scholarshipTemplates).insert(
    ScholarshipTemplatesCompanion.insert(
      id: templateId,
      name: 'Australia Awards Scholarship',
      providerName: 'Australian Government',
      shortDescription: const Value('Scholarships for development from Australia\'s government.'),
      country: const Value('Australia'),
      studyLevel: 'S2,S3',
      fundingType: const Value('Full'),
      website: const Value('https://www.australiaawardsindonesia.org/'),
      color: const Value('#D42E12'), // Using a red from the logo
      author: const Value('Official'),
      isFeatured: const Value(true),
    ),
    mode: InsertMode.insertOrReplace,
  );

  final appId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Application Phase', order: 1, 
    startDateOffsetDays: -90, // ~Feb 1 to Apr 30
    endDateOffsetDays: 0      // Deadline is anchor (end of April)
  ));
  final interviewId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Interview and English Test', order: 2,
    startDateOffsetDays: 60, // ~July
    endDateOffsetDays: 90
  ));
  await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Final Offer Notification', order: 3,
    startDateOffsetDays: 120, // ~August
    endDateOffsetDays: 120
  ));

  await db.batch((batch) {
    batch.insertAll(db.templateTasks, [
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Check eligibility requirements carefully'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Prepare all supporting documents (CV, KTP, etc)'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Take an IELTS or TOEFL test'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Complete the online application on the OASIS portal'),
      TemplateTasksCompanion.insert(milestoneId: interviewId, label: 'Prepare for Joint Selection Interview (JSI)'),
    ]);
  });

  await db.batch((batch) {
    batch.insertAll(db.templateDocuments, [
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Passport/KTP', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Birth Certificate', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'CV/Resume', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Certified University Transcripts & Degree', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'IELTS/TOEFL English Test Results', submissionType: const Value(DocumentSubmissionType.upload)),
    ]);
  });
}

// --- KOICA Seed Function ---
Future<void> _seedKOICA(AppDatabase db) async {
  const templateId = 'koica_master_2025';

    await db.customStatement('DELETE FROM template_tasks WHERE milestone_id IN (SELECT id FROM template_milestones WHERE template_id = ?);', [templateId]);
    await db.customStatement('DELETE FROM template_milestones WHERE template_id = ?;', [templateId]);
      await db.customStatement('DELETE FROM template_documents WHERE template_id = ?;', [templateId]);
      await db.customStatement('DELETE FROM scholarship_templates WHERE id = ?;', [templateId]);

  await db.into(db.scholarshipTemplates).insert(
    ScholarshipTemplatesCompanion.insert(
      id: templateId,
      name: 'KOICA Scholarship Program',
      providerName: 'KOICA (Korea International Cooperation Agency)',
      shortDescription: const Value('Master\'s degrees for government officials from partner countries.'),
      country: const Value('South Korea'),
      studyLevel: 'S2',
      fundingType: const Value('Full'),
      website: const Value('https://www.koica.go.kr/ciat/index.do'),
      color: const Value('#003DA5'),
      author: const Value('Official'),
      isFeatured: const Value(false),
    ),
    mode: InsertMode.insertOrReplace,
  );

  final appId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Application to University', order: 1, 
    startDateOffsetDays: -30, // Varies, but ~1 month window
    endDateOffsetDays: 0      // University deadline is anchor
  ));
  final interviewId = await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'KOICA Interview', order: 2,
    startDateOffsetDays: 60, // ~2 months after uni deadline
    endDateOffsetDays: 75
  ));
  await db.into(db.templateMilestones).insert(TemplateMilestonesCompanion.insert(
    templateId: templateId, name: 'Final Results', order: 3,
    startDateOffsetDays: 90, // ~1 month after interview
    endDateOffsetDays: 90
  ));

  await db.batch((batch) {
    batch.insertAll(db.templateTasks, [
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Choose target university and program from KOICA list'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Prepare all application documents as per university requirements'),
      TemplateTasksCompanion.insert(milestoneId: appId, label: 'Submit application package to university'),
      TemplateTasksCompanion.insert(milestoneId: interviewId, label: 'Prepare for KOICA country office interview'),
    ]);
  });

  await db.batch((batch) {
    batch.insertAll(db.templateDocuments, [
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'KOICA Application Form', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'University Application Form', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Letters of Recommendation', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'CV/Resume', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Passport Copy', submissionType: const Value(DocumentSubmissionType.upload)),
      TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Certified Transcripts & Degree', submissionType: const Value(DocumentSubmissionType.upload)),
    ]);
  });
}