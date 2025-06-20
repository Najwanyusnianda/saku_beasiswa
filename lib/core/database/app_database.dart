import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/services/notification_service.dart';

import 'tables/user_profiles.dart';
import 'tables/scholarship_templates.dart';
import 'tables/applications.dart';
import 'tables/tasks.dart';

import 'repositories/user_profile_repository.dart';
import 'repositories/scholarship_template_repository.dart';
import 'repositories/application_repository.dart';

import 'seed/seed_templates.dart';

part 'app_database.g.dart';






// --- DATABASE CLASS ---
// This is the main database class. The annotation `@DriftDatabase` tells
// the generator what tables to include.
@DriftDatabase(
  tables: [
  UserProfiles, 
  ScholarshipTemplates,
  Applications,
  Tasks
  ])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 5; // Increment this when you change tables

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await seedTemplates(this);
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        // Migration logic from version 1 to 2
        await m.createTable(scholarshipTemplates);
        await seedTemplates(this);
      }
      if (from < 3) {
        // Migration logic from version 2 to 3
        await m.createTable(applications);
        await m.createTable(tasks);
      }
      if (from < 4) {
        // Migration logic from version 3 to 4
        await m.addColumn(applications, applications.notes as GeneratedColumn<Object>);
      }
      if (from < 5) {
        // Migration from version 4 to 5
        await m.addColumn(scholarshipTemplates, scholarshipTemplates.description as GeneratedColumn);
        await m.addColumn(scholarshipTemplates, scholarshipTemplates.website as GeneratedColumn);
        await m.addColumn(scholarshipTemplates, scholarshipTemplates.region as GeneratedColumn);
        await m.addColumn(scholarshipTemplates, scholarshipTemplates.defaultStages as GeneratedColumn);
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

// A provider for our user profile repository.
// Repositories are the bridge between our UI/logic and the database.
@riverpod
UserProfileRepository userProfileRepository(Ref ref) {
  return UserProfileRepository(ref.watch(appDatabaseProvider));
}

// --- NEW REPOSITORY FOR TEMPLATES ---
@riverpod
ScholarshipTemplateRepository scholarshipTemplateRepository(Ref ref) {
  return ScholarshipTemplateRepository(ref.watch(appDatabaseProvider));
}

// --- NEW REPOSITORY FOR APPLICATIONS ---
@riverpod
ApplicationRepository applicationRepository(ApplicationRepositoryRef ref) {
  // Pass the ref to the repository
  return ApplicationRepository(ref.watch(appDatabaseProvider), ref);
}
