import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';

Future<void> seedTemplates(AppDatabase db) async {
  final templates = [
    const ScholarshipTemplatesCompanion(
      id: Value('lpdp-2024'),
      name: Value('Beasiswa LPDP Reguler'),
      providerName: Value('Kemenkeu RI'),
      studyLevels: Value('S2,S3'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('Global'),
      description: Value('Beasiswa reguler dari Lembaga Pengelola Dana Pendidikan untuk jenjang S2 dan S3.'),
      website: Value('https://lpdp.kemenkeu.go.id/'),
      region: Value('International'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('aas-2024'),
      name: Value('Australia Awards Scholarship'),
      providerName: Value('Australian Government'),
      studyLevels: Value('S2,S3'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('Australia'),
      description: Value('Scholarship from the Australian government for postgraduate studies.'),
      website: Value('https://www.australiaawardsindonesia.org/'),
      region: Value('International'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('chevening-2024'),
      name: Value('Chevening Scholarship'),
      providerName: Value('UK Government'),
      studyLevels: Value('S2'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('UK'),
      description: Value('UK government’s global scholarship programme, funded by the Foreign, Commonwealth & Development Office.'),
      website: Value('https://www.chevening.org/'),
      region: Value('International'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('unggul-2024'),
      name: Value('Beasiswa Unggulan'),
      providerName: Value('Kemendikbudristek'),
      studyLevels: Value('S1,S2,S3'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('Indonesia'),
      description: Value('Beasiswa dari pemerintah Indonesia untuk putra-putri terbaik bangsa Indonesia.'),
      website: Value('https://beasiswaunggulan.kemdikbud.go.id/'),
      region: Value('Indonesia'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('comp-sci-usa-2024'),
      name: Value('Fulbright Scholarship (STEM)'),
      providerName: Value('AMINEF (USA Government)'),
      studyLevels: Value('S2,S3'),
      fieldsOfStudy: Value('Computer Science,Engineering'),
      targetCountries: Value('USA'),
      description: Value('Scholarship for master\'s or doctoral degree in the US for STEM fields.'),
      website: Value('https://www.aminef.or.id/grants-for-indonesians/fulbright-programs/scholarship/'),
      region: Value('International'),
    ),
  ];
  
  await db.batch((batch) {
    batch.insertAll(db.scholarshipTemplates, templates, mode: InsertMode.insertOrReplace);
  });
}
