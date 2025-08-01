import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/db/database.dart';
import '../../domain/i_scholarship_repository.dart';
import '../repositories/scholarship_repository.dart';

/// Provider for the database instance
/// This should be provided at the app level, but included here for reference
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('AppDatabase should be provided at app level');
});

/// Single provider for all scholarship operations
/// Consolidates all scholarship-related functionality into one repository
final scholarshipRepositoryProvider = Provider<IScholarshipRepository>((ref) {
  final database = ref.read(appDatabaseProvider);
  return ScholarshipRepository(database);
});

/// Provider for checking if repository is ready
final isRepositoryReadyProvider = FutureProvider<bool>((ref) async {
  try {
    final repo = ref.read(scholarshipRepositoryProvider);
    final count = await repo.getScholarshipCount(null);
    return count >=
        0; // Changed to >= 0 since we might have 0 scholarships initially
  } catch (e) {
    return false;
  }
});
