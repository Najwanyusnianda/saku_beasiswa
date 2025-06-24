import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tables/user_profiles.dart';
import 'tables/scholarship_templates.dart';
import 'tables/user_applications.dart';
import 'tables/template_tasks.dart';
import 'tables/template_documents.dart';
import 'tables/template_milestones.dart';


import 'package:saku_beasiswa/core/models/document_submission_type.dart';
import 'package:saku_beasiswa/core/enums/document_status.dart';

import 'seed/seed_templates.dart';

part 'app_database.g.dart';



// --- DATABASE CLASS ---
// This is the main database class. The annotation `@DriftDatabase` tells
// the generator what tables to include.
@DriftDatabase(
  tables: [
    UserProfiles,
    ScholarshipTemplates,
    // Add the new tables to the database
    TemplateTasks,
    TemplateDocuments,
    TemplateMilestones,
    // Newly added user-specific tables
    UserApplications,
    UserMilestones,
    UserTasks,
    UserDocuments,
  ]
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 12; // bumped for user documents table

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await seedTemplates(this);
    },
    onUpgrade: (m, from, to) async {
          // You can add custom migration logic for each version bump
          if (from < 6) {
            // Since this is a major schema change, the simplest approach during
            // development is to delete the old tables and recreate them.
            // A more advanced migration would preserve user data.
            await m.deleteTable('scholarship_templates');
            await m.deleteTable('template_tasks'); // In case they existed
            await m.deleteTable('template_documents'); // In case they existed

            await m.createTable(scholarshipTemplates);
            await m.createTable(templateTasks);
            await m.createTable(templateDocuments);
            await seedTemplates(this); // Re-seed with new structure
          }
         if (from < 7) {
            // Add the new columns to the existing applications table
            // await m.addColumn(applications, applications.customName);
            // await m.addColumn(applications, applications.customColor);
            // await m.addColumn(applications, applications.customIcon);
          }
          if (from < 9) {
            // --- Logika Migrasi untuk Skema Template Baru ---
            // Hapus tabel lama jika ada (opsional, tapi lebih bersih)
            await m.deleteTable('scholarship_templates');
            // Buat kembali tabel dengan skema baru yang lengkap
            await m.createTable(scholarshipTemplates);
          }
          if (from < 10) {
            // --- Logika Migrasi untuk Skema Template Baru ---
            // Hapus tabel lama jika ada (opsional, tapi lebih bersih)
            await m.deleteTable('template_milestones');
            // Buat kembali tabel dengan skema baru yang lengkap
            await m.createTable(templateMilestones);
          }
          if (from < 11) {
            // Create user-specific application tables introduced in v10
            await m.createTable(userApplications);
            await m.createTable(userMilestones);
            await m.createTable(userTasks);
          }
          if (from < 12) {
            await m.createTable(userDocuments);
          }
        },
  );
}



// This function opens the database connection.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'saku_beasiswa.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

// --- PROVIDERS ---
// A Riverpod provider to give the rest of the app access to the database instance.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

// // A provider for our user profile repository.
// // Repositories are the bridge between our UI/logic and the database.
// @riverpod
// UserProfileRepository userProfileRepository(Ref ref) {
//   return UserProfileRepository(ref.watch(appDatabaseProvider));
// }

// // --- NEW REPOSITORY FOR TEMPLATES ---
// /*
// @riverpod
// ScholarshipTemplateRepository scholarshipTemplateRepository(Ref ref) {
//   return ScholarshipTemplateRepository(ref.watch(appDatabaseProvider));
// }
// */
// // --- NEW REPOSITORY FOR APPLICATIONS ---
// @riverpod
// ApplicationRepository applicationRepository(Ref ref) {
//   // Pass the ref to the repository
//   return ApplicationRepository(ref.watch(appDatabaseProvider), ref);
// }
