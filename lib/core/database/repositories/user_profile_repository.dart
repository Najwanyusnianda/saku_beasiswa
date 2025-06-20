import 'package:saku_beasiswa/core/database/app_database.dart';

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
