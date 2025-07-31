import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/db/database.dart';
import '../domain/models/user_profile.dart';
import '../domain/repositories/i_profile_repository.dart';
import '../infrastructure/daos/profile_dao.dart';
import '../infrastructure/repositories/profile_repository.dart';

part 'profile_service.g.dart';

// Database provider
@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

// DAO provider
@riverpod
ProfileDao profileDao(ProfileDaoRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return ProfileDao(database);
}

// Repository provider
@riverpod
IProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final dao = ref.watch(profileDaoProvider);
  return ProfileRepository(dao);
}

// Profile notifier for managing user profile state
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<UserProfile?> build() async {
    final repository = ref.read(profileRepositoryProvider);
    return repository.getCurrentProfile();
  }

  Future<void> saveProfile(UserProfile profile) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.saveUserProfile(profile);
      state = AsyncValue.data(profile);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateProfile(UserProfile profile) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.updateUserProfile(profile);
      state = AsyncValue.data(profile);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Stream provider for watching profile changes
@riverpod
Stream<UserProfile?> watchProfile(WatchProfileRef ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.watchUserProfile();
}
