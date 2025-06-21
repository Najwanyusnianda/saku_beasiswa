import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';

// The main function to call during migration/creation
Future<void> seedTemplates(AppDatabase db) async {
  await _seedLpdp(db);
  await _seedChevening(db);
  // Add calls to other seed functions here
}

// Private function to seed a single, complex template
Future<void> _seedLpdp(AppDatabase db) async {
  const templateId = 'lpdp_master_2025';

  // 1. Insert the main template data
  await db.into(db.scholarshipTemplates).insert(
        ScholarshipTemplatesCompanion.insert(
          id: templateId,
          name: 'LPDP – Master Scholarship',
          providerName: 'Kemenkeu RI',
          shortDescription: Value('Full tuition & living allowance for Indonesian citizens.'),
          country: Value('Global'),
          studyLevel: 'MASTER',
          color: Value('#0F6B86'),
          website: Value('https://lpdp.kemenkeu.go.id'),
          author: Value('Official'),
          version: Value(2),
        ),
        mode: InsertMode.insertOrReplace,
      );

  // 2. Insert the related tasks for this template
  final tasks = [
    TemplateTasksCompanion.insert(templateId: templateId, label: 'Research eligible universities', offsetDays: Value(-120)),
    TemplateTasksCompanion.insert(templateId: templateId, label: 'Book IELTS test', offsetDays: Value(-90)),
    TemplateTasksCompanion.insert(templateId: templateId, label: 'Draft motivation letter', offsetDays: Value(-75)),
    TemplateTasksCompanion.insert(templateId: templateId, label: 'Medical check-up', offsetDays: Value(-20), isMandatory: Value(false)),
    TemplateTasksCompanion.insert(templateId: templateId, label: 'Submit online form', offsetDays: Value(0)),
  ];
  await db.batch((batch) => batch.insertAll(db.templateTasks, tasks, mode: InsertMode.insertOrReplace));

  // 3. Insert the related documents for this template
  final documents = [
    TemplateDocumentsCompanion.insert(templateId: templateId, name: 'IELTS ≥6.5'),
    TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Passport Scan'),
    TemplateDocumentsCompanion.insert(templateId: templateId, name: 'Statement of Purpose'),
  ];
  await db.batch((batch) => batch.insertAll(db.templateDocuments, documents, mode: InsertMode.insertOrReplace));
}


Future<void> _seedChevening(AppDatabase db) async {
  const templateId = 'chevening_master_2025';
  await db.into(db.scholarshipTemplates).insert(
      ScholarshipTemplatesCompanion.insert(
        id: templateId,
        name: 'Chevening Scholarship',
        providerName: 'UK Government',
        studyLevel: 'MASTER',
        country: Value('UK'),
        shortDescription: Value('Global scholarship for future leaders to study in the UK.'),
        color: Value('#E84D1F'),
        website: Value('https://www.chevening.org/'),
        author: Value('Official'),
        version: Value(1),
      ),
      mode: InsertMode.insertOrReplace,
  );
  // Add tasks and documents for Chevening similarly...
}
