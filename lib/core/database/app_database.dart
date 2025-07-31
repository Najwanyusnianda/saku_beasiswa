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

// --- DATABASE CLASS ---
// This is the main database class. The annotation `@DriftDatabase` tells
// the generator what tables to include.
@DriftDatabase(tables: [UserProfiles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1; // Increment this when you change tables
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

// A provider for our future repository.
// Repositories are the bridge between our UI/logic and the database.
// We will implement this next.
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
