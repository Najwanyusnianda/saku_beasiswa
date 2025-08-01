import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/models/scholarship.dart';
import '../infrastructure/repositories/scholarship_detail_repository.dart';

part 'scholarship_detail_notifier.g.dart';

/// Notifier for managing individual scholarship detail state
/// This loads rich scholarship data from individual JSON files
@riverpod
class ScholarshipDetailNotifier extends _$ScholarshipDetailNotifier {
  late final ScholarshipDetailRepository _repository;

  @override
  Future<Scholarship> build(String scholarshipId) async {
    _repository = ScholarshipDetailRepository();
    return await _repository.getScholarshipById(scholarshipId);
  }

  /// Refresh scholarship details
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final scholarship = await _repository.getScholarshipById(
        state.value!.id, // Get current scholarship ID
      );
      state = AsyncValue.data(scholarship);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Check if scholarship exists
  Future<bool> scholarshipExists(String scholarshipId) async {
    return await _repository.scholarshipExists(scholarshipId);
  }
}

/// Provider for getting saved scholarship details
@riverpod
class SavedScholarshipsDetailNotifier
    extends _$SavedScholarshipsDetailNotifier {
  late final ScholarshipDetailRepository _repository;

  @override
  Future<List<Scholarship>> build(List<String> scholarshipIds) async {
    _repository = ScholarshipDetailRepository();
    return await _repository.getScholarshipsByIds(scholarshipIds);
  }

  /// Refresh all saved scholarship details
  Future<void> refresh() async {
    if (state.value == null) return;

    state = const AsyncValue.loading();
    try {
      final scholarshipIds = state.value!.map((s) => s.id).toList();
      final scholarships = await _repository.getScholarshipsByIds(
        scholarshipIds,
      );
      state = AsyncValue.data(scholarships);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
