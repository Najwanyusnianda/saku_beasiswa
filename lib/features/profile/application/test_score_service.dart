import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/models/test_score.dart';
import '../domain/i_profile_repository.dart';
import 'profile_service.dart';

part 'test_score_service.g.dart';

// Test Score notifier for managing test scores state
@riverpod
class TestScoreNotifier extends _$TestScoreNotifier {
  @override
  Future<List<TestScore>> build(int userId) async {
    final repository = ref.read(profileRepositoryProvider);
    return repository.getTestScores(userId);
  }

  Future<void> addTestScore(TestScore testScore) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.saveTestScore(testScore);

      // Refresh the list
      final updatedScores = await repository.getTestScores(testScore.userId);
      state = AsyncValue.data(updatedScores);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateTestScore(TestScore testScore) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.updateTestScore(testScore);

      // Refresh the list
      final updatedScores = await repository.getTestScores(testScore.userId);
      state = AsyncValue.data(updatedScores);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteTestScore(int testScoreId, int userId) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.deleteTestScore(testScoreId);

      // Refresh the list
      final updatedScores = await repository.getTestScores(userId);
      state = AsyncValue.data(updatedScores);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Stream provider for watching test scores changes
@riverpod
Stream<List<TestScore>> watchTestScores(WatchTestScoresRef ref, int userId) {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.watchTestScores(userId);
}
