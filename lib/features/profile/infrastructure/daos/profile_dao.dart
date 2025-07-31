import 'package:drift/drift.dart';
import '../../../../core/db/database.dart';
import '../../../../core/db/tables/users_table.dart';
import '../../../../core/db/tables/test_scores_table.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/models/test_score.dart' as domain;

part 'profile_dao.g.dart';

@DriftAccessor(tables: [Users, TestScores])
class ProfileDao extends DatabaseAccessor<AppDatabase> with _$ProfileDaoMixin {
  ProfileDao(AppDatabase db) : super(db);

  // User Profile operations
  Future<UserProfile?> getCurrentProfile() async {
    final user = await (select(users)..limit(1)).getSingleOrNull();
    if (user == null) return null;
    
    return UserProfile(
      id: user.id,
      fullName: user.fullName,
      email: user.email,
      phoneNumber: user.phoneNumber,
      dateOfBirth: user.dateOfBirth,
      city: user.city,
      currentEducationLevel: user.currentEducationLevel,
      institution: user.institution,
      majorField: user.majorField,
      currentGpa: user.currentGpa,
      expectedGraduation: user.expectedGraduation,
      profilePhotoPath: user.profilePhotoPath,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }

  Stream<UserProfile?> watchUserProfile() {
    return (select(users)..limit(1)).watchSingleOrNull().map((user) {
      if (user == null) return null;
      return UserProfile(
        id: user.id,
        fullName: user.fullName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        dateOfBirth: user.dateOfBirth,
        city: user.city,
        currentEducationLevel: user.currentEducationLevel,
        institution: user.institution,
        majorField: user.majorField,
        currentGpa: user.currentGpa,
        expectedGraduation: user.expectedGraduation,
        profilePhotoPath: user.profilePhotoPath,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
      );
    });
  }

  Future<int> insertUserProfile(UserProfile profile) {
    return into(users).insert(UsersCompanion(
      fullName: Value(profile.fullName),
      email: Value(profile.email),
      phoneNumber: profile.phoneNumber != null ? Value(profile.phoneNumber!) : const Value.absent(),
      dateOfBirth: profile.dateOfBirth != null ? Value(profile.dateOfBirth!) : const Value.absent(),
      city: profile.city != null ? Value(profile.city!) : const Value.absent(),
      currentEducationLevel: Value(profile.currentEducationLevel),
      institution: Value(profile.institution),
      majorField: Value(profile.majorField),
      currentGpa: profile.currentGpa != null ? Value(profile.currentGpa!) : const Value.absent(),
      expectedGraduation: profile.expectedGraduation != null ? Value(profile.expectedGraduation!) : const Value.absent(),
      profilePhotoPath: profile.profilePhotoPath != null ? Value(profile.profilePhotoPath!) : const Value.absent(),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<void> updateUserProfile(UserProfile profile) {
    return (update(users)..where((tbl) => tbl.id.equals(profile.id))).write(
      UsersCompanion(
        fullName: Value(profile.fullName),
        email: Value(profile.email),
        phoneNumber: profile.phoneNumber != null ? Value(profile.phoneNumber!) : const Value.absent(),
        dateOfBirth: profile.dateOfBirth != null ? Value(profile.dateOfBirth!) : const Value.absent(),
        city: profile.city != null ? Value(profile.city!) : const Value.absent(),
        currentEducationLevel: Value(profile.currentEducationLevel),
        institution: Value(profile.institution),
        majorField: Value(profile.majorField),
        currentGpa: profile.currentGpa != null ? Value(profile.currentGpa!) : const Value.absent(),
        expectedGraduation: profile.expectedGraduation != null ? Value(profile.expectedGraduation!) : const Value.absent(),
        profilePhotoPath: profile.profilePhotoPath != null ? Value(profile.profilePhotoPath!) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // Test Score operations
  Future<List<domain.TestScore>> getTestScores(int userId) async {
    final scores = await (select(testScores)
          ..where((tbl) => tbl.userId.equals(userId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.testDate)]))
        .get();

    return scores
        .map((score) => domain.TestScore(
              id: score.id,
              userId: score.userId,
              testType: score.testType,
              overallScore: score.overallScore,
              testDate: score.testDate,
              detailedScores: score.detailedScores,
              createdAt: score.createdAt,
            ))
        .toList();
  }

  Stream<List<domain.TestScore>> watchTestScores(int userId) {
    return (select(testScores)
          ..where((tbl) => tbl.userId.equals(userId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.testDate)]))
        .watch()
        .map((scores) => scores
            .map((score) => domain.TestScore(
                  id: score.id,
                  userId: score.userId,
                  testType: score.testType,
                  overallScore: score.overallScore,
                  testDate: score.testDate,
                  detailedScores: score.detailedScores,
                  createdAt: score.createdAt,
                ))
            .toList());
  }

  Future<int> insertTestScore(domain.TestScore testScore) {
    return into(testScores).insert(TestScoresCompanion(
      userId: Value(testScore.userId),
      testType: Value(testScore.testType),
      overallScore: Value(testScore.overallScore),
      testDate: Value(testScore.testDate),
      detailedScores: Value(testScore.detailedScores),
    ));
  }

  Future<void> updateTestScore(domain.TestScore testScore) {
    return (update(testScores)..where((tbl) => tbl.id.equals(testScore.id)))
        .write(TestScoresCompanion(
      testType: Value(testScore.testType),
      overallScore: Value(testScore.overallScore),
      testDate: Value(testScore.testDate),
      detailedScores: Value(testScore.detailedScores),
    ));
  }

  Future<void> deleteTestScore(int testScoreId) {
    return (delete(testScores)..where((tbl) => tbl.id.equals(testScoreId)))
        .go();
  }
}
