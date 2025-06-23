//lib/core/database/seed/seed_templates.dart
import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';

// The main function to call during migration/creation
Future<void> seedTemplates(AppDatabase db) async {
  await _seedLPDP(db);
  await _seedChevening(db);
  await _seedFulbright(db);
  await _seedErasmus(db);

  // Add calls to other seed functions here
}

Future<void> _seedLPDP(AppDatabase db) async {
    const templateId = 'lpdp_master_2025';

    // 1. Seed Template Utama
    await db.into(db.scholarshipTemplates).insert(
          ScholarshipTemplatesCompanion.insert(
            id: templateId,
            name: 'LPDP – Master & Doktoral',
            providerName: 'Kemenkeu RI',
            shortDescription: Value('Beasiswa penuh untuk WNI di universitas terbaik dunia.'),
            longDescription: Value('LPDP menyediakan beasiswa penuh untuk jenjang Magister dan Doktoral bagi putra-putri terbaik Indonesia untuk mengembangkan pemimpin masa depan.'),
            country: Value('Global'),
            studyLevel: 'S2,S3',
            fieldOfStudy: Value('Prioritas Pembangunan Nasional'),
            fundingType: Value('Full'),
            applicationDeadline: Value(DateTime(2025, 7, 15)),
            eligibility: Value('WNI, Batas Usia, LoA Unconditional'),
            requiredGPA: Value('3.00 (S2), 3.25 (S3)'),
            languageRequirements: Value('TOEFL iBT 80 / IELTS 6.5'),
            website: Value('https://lpdp.kemenkeu.go.id'),
            color: Value('#0F6B86'),
            author: Value('Official'),
            isFeatured: Value(true),
          ),
          mode: InsertMode.insertOrReplace,
        );

    // 2. Seed Dokumen Terkait
    final documents = [
      (name: 'Personal Statement / Esai Kontribusi', isOptional: false),
      (name: 'CV/Resume', isOptional: false),
      (name: 'Transkrip Akademik', isOptional: false),
      (name: 'Surat Rekomendasi (2)', isOptional: false),
      (name: 'Letter of Acceptance (LoA) Unconditional', isOptional: false),
      (name: 'Sertifikat Bahasa Inggris', isOptional: false),
    ];
    await db.batch((batch) {
      batch.insertAll(
          db.templateDocuments,
          documents.map((d) => TemplateDocumentsCompanion.insert(
              templateId: templateId, name: d.name, isOptional: Value(d.isOptional))),
          mode: InsertMode.insertOrIgnore);
    });
    
    // 3. Seed Tugas Terkait
    final tasks = [
      (label: 'Riset universitas & program studi', stage: 'Research', offsetDays: -180),
      (label: 'Persiapan tes bahasa (IELTS/TOEFL)', stage: 'Tests', offsetDays: -150),
      (label: 'Daftar & ambil tes bahasa', stage: 'Tests', offsetDays: -120),
      (label: 'Minta surat rekomendasi', stage: 'Documents', offsetDays: -100),
      (label: 'Daftar ke universitas & kejar LoA', stage: 'Application', offsetDays: -90),
      (label: 'Tulis draf esai kontribusi', stage: 'Documents', offsetDays: -60),
      (label: 'Lengkapi aplikasi online LPDP', stage: 'Application', offsetDays: -30),
      (label: 'Submit aplikasi sebelum deadline', stage: 'Submission', offsetDays: 0),
    ];
    await db.batch((batch) {
      batch.insertAll(
          db.templateTasks,
          tasks.map((t) => TemplateTasksCompanion.insert(
              templateId: templateId, label: t.label, stage: Value(t.stage), offsetDays: Value(t.offsetDays))),
          mode: InsertMode.insertOrIgnore);
    });
  }

Future<void> _seedChevening(AppDatabase db) async {
  const templateId = 'chevening_master_2025';
  await db.into(db.scholarshipTemplates).insert(
        ScholarshipTemplatesCompanion.insert(
          id: templateId,
          name: 'Chevening Scholarship',
          providerName: 'UK Government',
          shortDescription: Value('Global scholarship for future leaders to study in the UK.'),
          longDescription: Value('Chevening enables outstanding emerging leaders from all over the world to pursue one-year master’s degrees in the UK.'),
          country: Value('UK'),
          studyLevel: 'S2',
          fieldOfStudy: Value('All subjects'),
          fundingType: Value('Full'),
          applicationDeadline: Value(DateTime(2024, 11, 7)), // Example date
          eligibility: Value('Citizen of a Chevening-eligible country, 2 years work experience, undergraduate degree.'),
          website: Value('https://www.chevening.org/'),
          color: Value('#E84D1F'),
          author: Value('Official'),
          isFeatured: Value(true),
        ),
        mode: InsertMode.insertOrReplace,
      );

  final documents = [
    (name: 'University Transcripts & Degree Certificate', isOptional: false),
    (name: 'References (2)', isOptional: false),
    (name: 'Unconditional UK University Offer', isOptional: false),
    (name: 'Passport/ID Card', isOptional: false),
  ];
  await db.batch((batch) {
    batch.insertAll(
        db.templateDocuments,
        documents.map((d) => TemplateDocumentsCompanion.insert(
            templateId: templateId, name: d.name, isOptional: Value(d.isOptional))),
        mode: InsertMode.insertOrIgnore);
  });

  final tasks = [
    (label: 'Apply to 3 eligible UK university courses', stage: 'Application', offsetDays: -120),
    (label: 'Prepare and write 4 leadership essays', stage: 'Documents', offsetDays: -60),
    (label: 'Secure 2 professional/academic references', stage: 'Documents', offsetDays: -45),
    (label: 'Submit Chevening online application', stage: 'Submission', offsetDays: 0),
  ];
  await db.batch((batch) {
    batch.insertAll(
        db.templateTasks,
        tasks.map((t) => TemplateTasksCompanion.insert(
            templateId: templateId, label: t.label, stage: Value(t.stage), offsetDays: Value(t.offsetDays))),
        mode: InsertMode.insertOrIgnore);
  });
}

Future<void> _seedFulbright(AppDatabase db) async {
  const templateId = 'fulbright_master_2025';
  await db.into(db.scholarshipTemplates).insert(
        ScholarshipTemplatesCompanion.insert(
          id: templateId,
          name: 'Fulbright Scholarship (Indonesia)',
          providerName: 'AMINEF / U.S. Department of State',
          shortDescription: Value('Promoting mutual understanding between the US and Indonesia.'),
          longDescription: Value('The Fulbright Program offers grants for graduate students from Indonesia to study in the United States.'),
          country: Value('USA'),
          studyLevel: 'S2,S3',
          fieldOfStudy: Value('All fields except medical sciences'),
          fundingType: Value('Full'),
          applicationDeadline: Value(DateTime(2025, 2, 15)), // Example date
          eligibility: Value('Indonesian citizen, possess a Bachelor degree (S1), minimum GPA of 3.0, minimum TOEFL ITP 550 or equivalent.'),
          website: Value('https://www.aminef.or.id/'),
          color: Value('#00487B'),
          author: Value('Official'),
          isFeatured: Value(true),
        ),
        mode: InsertMode.insertOrReplace,
      );

  final documents = [
    (name: 'Completed Application Form', isOptional: false),
    (name: 'Copy of latest degree transcript', isOptional: false),
    (name: 'Copy of official ITP TOEFL/IELTS score report', isOptional: false),
    (name: 'Two letters of reference', isOptional: false),
    (name: 'CV/Resume', isOptional: false),
    (name: 'Study/Research Objective Essay', isOptional: false),
  ];
  await db.batch((batch) {
    batch.insertAll(
        db.templateDocuments,
        documents.map((d) => TemplateDocumentsCompanion.insert(
            templateId: templateId, name: d.name, isOptional: Value(d.isOptional))),
        mode: InsertMode.insertOrIgnore);
  });

  final tasks = [
    (label: 'Take TOEFL/IELTS test', stage: 'Tests', offsetDays: -90),
    (label: 'Draft Study/Research Objective', stage: 'Documents', offsetDays: -60),
    (label: 'Request letters of reference', stage: 'Documents', offsetDays: -45),
    (label: 'Complete and submit application form', stage: 'Submission', offsetDays: 0),
  ];
  await db.batch((batch) {
    batch.insertAll(
        db.templateTasks,
        tasks.map((t) => TemplateTasksCompanion.insert(
            templateId: templateId, label: t.label, stage: Value(t.stage), offsetDays: Value(t.offsetDays))),
        mode: InsertMode.insertOrIgnore);
  });
}

Future<void> _seedErasmus(AppDatabase db) async {
  const templateId = 'erasmus_mundus_2025';
  await db.into(db.scholarshipTemplates).insert(
        ScholarshipTemplatesCompanion.insert(
          id: templateId,
          name: 'Erasmus Mundus Joint Masters',
          providerName: 'European Union',
          shortDescription: Value('Study in at least two different European countries.'),
          longDescription: Value('Erasmus Mundus Joint Masters are high-level integrated study programmes at master level, delivered by an international consortium of higher education institutions.'),
          country: Value('Europe (Multiple)'),
          studyLevel: 'S2',
          fieldOfStudy: Value('Varies by program'),
          fundingType: Value('Full'),
          applicationDeadline: Value(DateTime(2025, 1, 31)), // Varies greatly
          eligibility: Value('Bachelor\'s degree. No country restrictions for most programs. Specific requirements depend on the chosen master program.'),
          website: Value('https://www.eacea.ec.europa.eu/scholarships/erasmus-mundus-joint-masters_en'),
          color: Value('#003399'),
          author: Value('Official'),
          isFeatured: Value(false),
        ),
        mode: InsertMode.insertOrReplace,
      );

  final documents = [
    (name: 'CV (Europass format recommended)', isOptional: false),
    (name: 'Motivation Letter', isOptional: false),
    (name: 'Letters of Recommendation (2)', isOptional: false),
    (name: 'University Transcripts & Degree', isOptional: false),
    (name: 'Proof of Residence', isOptional: false),
    (name: 'English Proficiency Test (e.g., IELTS/TOEFL)', isOptional: false),
  ];
  await db.batch((batch) {
    batch.insertAll(
        db.templateDocuments,
        documents.map((d) => TemplateDocumentsCompanion.insert(
            templateId: templateId, name: d.name, isOptional: Value(d.isOptional))),
        mode: InsertMode.insertOrIgnore);
  });

  final tasks = [
    (label: 'Browse EMJM Catalogue and select programs', stage: 'Research', offsetDays: -120),
    (label: 'Prepare CV and Motivation Letter per program', stage: 'Documents', offsetDays: -60),
    (label: 'Contact referees for recommendation letters', stage: 'Documents', offsetDays: -50),
    (label: 'Submit application to program consortium', stage: 'Submission', offsetDays: 0),
  ];
  await db.batch((batch) {
    batch.insertAll(
        db.templateTasks,
        tasks.map((t) => TemplateTasksCompanion.insert(
            templateId: templateId, label: t.label, stage: Value(t.stage), offsetDays: Value(t.offsetDays))),
        mode: InsertMode.insertOrIgnore);
  });
}
