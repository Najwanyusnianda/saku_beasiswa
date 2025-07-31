import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/models/user_profile.dart';
import '../domain/models/test_score.dart';
import '../domain/repositories/i_profile_repository.dart';
import 'profile_service.dart';

part 'database_seeder.g.dart';

class DatabaseSeeder {
  final IProfileRepository _profileRepository;

  DatabaseSeeder(this._profileRepository);

  /// Seeds the database with default data if it's empty
  Future<void> seedDatabaseIfEmpty() async {
    try {
      // Check if user data already exists
      final existingProfile = await _profileRepository.getCurrentProfile();

      if (existingProfile == null) {
        await _seedDefaultUserProfile();
        await _seedDefaultTestScores();
      }
    } catch (e) {
      // Log error but don't throw - app should still work without seeded data
      print('Failed to seed database: $e');
    }
  }

  Future<void> _seedDefaultUserProfile() async {
    final defaultUser = UserProfile(
      id: 1,
      fullName: 'Sarah Putri',
      email: 'sarah.putri@example.com',
      phoneNumber: '081234567890',
      dateOfBirth: DateTime(2002, 3, 15),
      city: 'Jakarta',
      currentEducationLevel: 'S1 (Sarjana)',
      institution: 'Universitas Indonesia',
      majorField: 'Computer Science',
      currentGpa: 3.75,
      expectedGraduation: DateTime(2025, 7),
      profilePhotoPath: null, // Will use default avatar
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _profileRepository.saveUserProfile(defaultUser);
  }

  Future<void> _seedDefaultTestScores() async {
    final defaultTestScores = [
      TestScore(
        id: 1,
        userId: 1,
        testType: 'ielts',
        overallScore: 7.5,
        testDate: DateTime(2024, 6, 15),
        detailedScores: 'L:7.5, R:8.0, W:7.0, S:7.5',
        certificateUrl:
            'https://example.com/certificates/ielts-john-doe-2024.pdf',
        createdAt: DateTime.now(),
      ),
      TestScore(
        id: 2,
        userId: 1,
        testType: 'toefl',
        overallScore: 0.0, // Not taken yet, use 0 as placeholder
        testDate:
            DateTime.now(), // Required field, will be updated when actually taken
        detailedScores: null,
        certificateUrl: null,
        createdAt: DateTime.now(),
      ),
      TestScore(
        id: 3,
        userId: 1,
        testType: 'gre',
        overallScore: 0.0, // Not taken yet, use 0 as placeholder
        testDate:
            DateTime.now(), // Required field, will be updated when actually taken
        detailedScores: null,
        certificateUrl: null,
        createdAt: DateTime.now(),
      ),
    ];

    for (final testScore in defaultTestScores) {
      await _profileRepository.saveTestScore(testScore);
    }
  }
}

// Riverpod provider for database seeder
@riverpod
DatabaseSeeder databaseSeeder(Ref ref) {
  final profileRepo = ref.read(profileRepositoryProvider);
  return DatabaseSeeder(profileRepo);
}
