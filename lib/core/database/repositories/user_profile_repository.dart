import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';

part 'user_profile_repository.g.dart';

@riverpod
UserProfileRepository userProfileRepository(Ref ref) {
  return UserProfileRepository(ref.watch(appDatabaseProvider));
}

class UserProfileRepository {
  final AppDatabase _db;
  UserProfileRepository(this._db);

  Future<void> saveProfile(UserProfile profile) async {
    await _db.into(_db.userProfiles).insertOnConflictUpdate(profile);
  }

  Future<UserProfile?> getProfile() async {
    return (_db.select(_db.userProfiles)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();
  }
}