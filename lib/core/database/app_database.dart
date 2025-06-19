import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_database.g.dart';

// --- TABLE DEFINITIONS ---
// We start with the UserProfile table.
// Drift will generate a class called `UserProfile` from this.
@DataClassName('UserProfile')
class UserProfiles extends Table {
  // The user will always have ID 1 for simplicity in this single-user app.
  IntColumn get id => integer().withDefault(const Constant(1))();
  
  // S1, S2, S3
  TextColumn get studyLevel => text().nullable()();

  // e.g., "Computer Science"
  TextColumn get fieldOfStudy => text().nullable()();

  // We will store the list of countries as a single comma-separated string.
  // This is a simple approach. For more complex needs, a separate table could be used.
  TextColumn get targetCountries => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// --- NEW TABLE ---
@DataClassName('ScholarshipTemplate')
class ScholarshipTemplates extends Table {
  // Use a unique text ID like 'lpdp-2024'
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get providerName => text().named('provider_name')();
  TextColumn get logoUrl => text().nullable()();
  
  // Stored as a comma-separated string: "S1,S2"
  TextColumn get studyLevels => text()();
  
  // Stored as a comma-separated string: "Computer Science,Engineering"
  TextColumn get fieldsOfStudy => text().named('fields_of_study')();
  
  // Stored as a comma-separated string: "USA,UK,Global"
  TextColumn get targetCountries => text().named('target_countries')();

  @override
  Set<Column> get primaryKey => {id};
}

// --- DATABASE CLASS ---
// This is the main database class. The annotation `@DriftDatabase` tells
// the generator what tables to include.
@DriftDatabase(tables: [UserProfiles, ScholarshipTemplates])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2; // Increment this when you change tables

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      // SEED the database with initial templates on creation
      await _seedTemplates(this);
    },
    onUpgrade: (m, from, to) async {
      // Logic for future migrations if the schema changes
      if (from == 1) {
        await m.createTable(scholarshipTemplates);
        await _seedTemplates(this);
      }
    },
  );
}

// --- SEEDING FUNCTION ---
// This function adds our initial scholarship data.
Future<void> _seedTemplates(AppDatabase db) async {
  final templates = [
    // Add some sample data here. In a real app, this would come from a server.
    const ScholarshipTemplatesCompanion(
      id: Value('lpdp-2024'),
      name: Value('Beasiswa LPDP Reguler'),
      providerName: Value('Kemenkeu RI'),
      studyLevels: Value('S2,S3'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('Global'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('aas-2024'),
      name: Value('Australia Awards Scholarship'),
      providerName: Value('Australian Government'),
      studyLevels: Value('S2,S3'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('Australia'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('chevening-2024'),
      name: Value('Chevening Scholarship'),
      providerName: Value('UK Government'),
      studyLevels: Value('S2'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('UK'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('unggul-2024'),
      name: Value('Beasiswa Unggulan'),
      providerName: Value('Kemendikbudristek'),
      studyLevels: Value('S1,S2,S3'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('Indonesia'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('comp-sci-usa-2024'),
      name: Value('Fulbright Scholarship (STEM)'),
      providerName: Value('AMINEF (USA Government)'),
      studyLevels: Value('S2,S3'),
      fieldsOfStudy: Value('Computer Science,Engineering'),
      targetCountries: Value('USA'),
    ),
  ];
  
  await db.batch((batch) {
    batch.insertAll(db.scholarshipTemplates, templates, mode: InsertMode.insertOrReplace);
  });
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
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

// A provider for our user profile repository.
// Repositories are the bridge between our UI/logic and the database.
@riverpod
UserProfileRepository userProfileRepository(UserProfileRepositoryRef ref) {
  return UserProfileRepository(ref.watch(appDatabaseProvider));
}

// --- REPOSITORY ---
// This class encapsulates all the database logic for UserProfiles.
// Our UI will interact with this repository, not the database directly.
class UserProfileRepository {
  final AppDatabase _db;
  UserProfileRepository(this._db);

  // Method to create or update the user profile.
  // We use `insertOnConflictUpdate` because there's only one user profile (ID 1).
  Future<void> saveProfile(UserProfile profile) async {
    await _db.into(_db.userProfiles).insertOnConflictUpdate(profile);
  }

  // Method to get the user profile.
  Future<UserProfile?> getProfile() async {
    // We get the profile with ID 1. It might not exist on the first run.
    return (_db.select(_db.userProfiles)
          ..where((tbl) => tbl.id.equals(1)))
        .getSingleOrNull();
  }
}

// --- NEW REPOSITORY FOR TEMPLATES ---
@riverpod
ScholarshipTemplateRepository scholarshipTemplateRepository(ScholarshipTemplateRepositoryRef ref) {
  return ScholarshipTemplateRepository(ref.watch(appDatabaseProvider));
}

class ScholarshipTemplateRepository {
  final AppDatabase _db;
  ScholarshipTemplateRepository(this._db);

  // Method to find matching templates based on a user's profile
  Future<List<ScholarshipTemplate>> findMatchingTemplates(UserProfile profile) async {
    // Artificial delay to simulate a network call and show our loading animation
    await Future.delayed(const Duration(seconds: 3));

    if (profile.studyLevel == null || profile.fieldOfStudy == null) {
      // If profile is incomplete, return all templates
      return _db.select(_db.scholarshipTemplates).get();
    }


    // Build a dynamic query
    final query = _db.select(_db.scholarshipTemplates)
      ..where((tbl) {
        // Study Level check: "S2" is contained in "S1,S2,S3"
        final studyLevelMatch = tbl.studyLevels.contains(profile.studyLevel!);
        // Field of study check: template is for 'All' OR contains the user's major
        final fieldOfStudyMatch = tbl.fieldsOfStudy.equals('All') | 
                                tbl.fieldsOfStudy.contains(profile.fieldOfStudy!);
        
        return studyLevelMatch & fieldOfStudyMatch;
      });
    
    return query.get();
  }
}
