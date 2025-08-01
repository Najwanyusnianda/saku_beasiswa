import '../../domain/i_profile_repository.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/models/test_score.dart';
import '../data_sources/profile_dao.dart';

class ProfileRepository implements IProfileRepository {
  final ProfileDao _dao;

  const ProfileRepository(this._dao);

  @override
  Future<UserProfile?> getCurrentProfile() {
    return _dao.getCurrentProfile();
  }

  @override
  Future<void> saveUserProfile(UserProfile profile) async {
    // Check if profile already exists
    final existing = await getCurrentProfile();
    if (existing == null) {
      await _dao.insertUserProfile(profile);
    } else {
      await _dao.updateUserProfile(profile.copyWith(id: existing.id));
    }
  }

  @override
  Future<void> updateUserProfile(UserProfile profile) {
    return _dao.updateUserProfile(profile);
  }

  @override
  Stream<UserProfile?> watchUserProfile() {
    return _dao.watchUserProfile();
  }

  @override
  Future<List<TestScore>> getTestScores(int userId) {
    return _dao.getTestScores(userId);
  }

  @override
  Future<void> saveTestScore(TestScore testScore) {
    return _dao.insertTestScore(testScore);
  }

  @override
  Future<void> updateTestScore(TestScore testScore) {
    return _dao.updateTestScore(testScore);
  }

  @override
  Future<void> deleteTestScore(int testScoreId) {
    return _dao.deleteTestScore(testScoreId);
  }

  @override
  Stream<List<TestScore>> watchTestScores(int userId) {
    return _dao.watchTestScores(userId);
  }
}
