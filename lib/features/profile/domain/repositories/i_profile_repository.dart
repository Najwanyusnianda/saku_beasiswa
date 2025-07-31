import '../models/user_profile.dart';
import '../models/test_score.dart';

abstract class IProfileRepository {
  // User Profile methods
  Future<UserProfile?> getCurrentProfile();
  Future<void> saveUserProfile(UserProfile profile);
  Future<void> updateUserProfile(UserProfile profile);
  Stream<UserProfile?> watchUserProfile();
  
  // Test Score methods
  Future<List<TestScore>> getTestScores(int userId);
  Future<void> saveTestScore(TestScore testScore);
  Future<void> updateTestScore(TestScore testScore);
  Future<void> deleteTestScore(int testScoreId);
  Stream<List<TestScore>> watchTestScores(int userId);
}
