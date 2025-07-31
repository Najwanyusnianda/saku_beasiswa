import '../../domain/models/scholarship.dart';
import '../../domain/repositories/i_scholarship_repository.dart';
import '../../domain/models/scholarship_filter.dart';
import '../../domain/models/scholarship_match.dart';
import '../../../../core/services/scholarship_json_loader.dart';

/// Implementation of IScholarshipRepository that loads data from JSON assets
/// This follows the one-file-per-scholarship approach in assets/scholarships/
class JsonScholarshipRepository implements IScholarshipRepository {
  List<Scholarship>? _cachedScholarships;

  Stream<List<Scholarship>> watchAllScholarships() async* {
    // Cache scholarships to avoid reloading assets repeatedly
    _cachedScholarships ??= await ScholarshipJsonLoader.loadAllScholarshipModels();
    yield _cachedScholarships!;
  }

  Stream<List<Scholarship>> watchFilteredScholarships(ScholarshipFilter filter) async* {
    final scholarships = await _getAllScholarships();
    // Apply filters - implement based on filter criteria
    yield scholarships;
  }

  Stream<List<Scholarship>> searchScholarships(String query) async* {
    final scholarships = await _getAllScholarships();
    final lowerQuery = query.toLowerCase();
    
    final filtered = scholarships.where((scholarship) {
      return scholarship.title.toLowerCase().contains(lowerQuery) ||
             scholarship.provider.toLowerCase().contains(lowerQuery) ||
             scholarship.basicInfo.description.toLowerCase().contains(lowerQuery) ||
             scholarship.tags.any((tag) => tag.toLowerCase().contains(lowerQuery));
    }).toList();
    
    yield filtered;
  }

  Future<Scholarship?> getScholarshipById(String scholarshipId) async {
    final scholarships = await _getAllScholarships();
    try {
      return scholarships.firstWhere((scholarship) => scholarship.id == scholarshipId);
    } catch (e) {
      return null;
    }
  }

  Stream<List<ScholarshipMatch>> watchScholarshipMatches(
    int userId, 
    ScholarshipFilter? filter,
  ) async* {
    // For now, return empty stream - this requires user profile matching
    yield [];
  }

  Stream<List<ScholarshipCardData>> watchScholarshipCards(
    int userId,
    ScholarshipFilter? filter,
  ) async* {
    // For now, return empty stream - this requires card data conversion
    yield [];
  }

  Future<void> saveScholarship(int userId, String scholarshipId) async {
    // For now, no-op - would require database implementation
  }

  Future<void> unsaveScholarship(int userId, String scholarshipId) async {
    // For now, no-op - would require database implementation
  }

  Future<bool> isScholarshipSaved(int userId, String scholarshipId) async {
    // For now, return false - would require database implementation
    return false;
  }

  Stream<List<String>> watchSavedScholarshipIds(int userId) async* {
    // For now, return empty stream - would require database implementation
    yield [];
  }

  Future<int> getScholarshipCount(ScholarshipFilter? filter) async {
    final scholarships = await _getAllScholarships();
    return scholarships.length;
  }

  Future<Map<String, dynamic>> getScholarshipStats() async {
    final scholarships = await _getAllScholarships();
    
    // Calculate basic stats
    final providers = scholarships.map((s) => s.provider).toSet();
    final countries = scholarships.map((s) => s.providerCountry).toSet();
    
    return {
      'total': scholarships.length,
      'providers': providers.length,
      'countries': countries.length,
    };
  }

  Stream<List<ScholarshipCardData>> watchTrendingScholarships(int userId) async* {
    // For now, return empty stream - would require analytics data
    yield [];
  }

  Stream<List<ScholarshipCardData>> watchUpcomingDeadlines(
    int userId, 
    int daysAhead,
  ) async* {
    // For now, return empty stream - would require date filtering
    yield [];
  }

  Future<void> addToApplicationPlan(int userId, String scholarshipId) async {
    // For now, no-op - would require database implementation
  }

  Future<void> removeFromApplicationPlan(int userId, String scholarshipId) async {
    // For now, no-op - would require database implementation
  }

  Stream<List<ScholarshipCardData>> watchApplicationPlan(int userId) async* {
    // For now, return empty stream - would require database implementation
    yield [];
  }

  // Private helper methods
  Future<List<Scholarship>> _getAllScholarships() async {
    _cachedScholarships ??= await ScholarshipJsonLoader.loadAllScholarshipModels();
    return _cachedScholarships!;
  }

  /// Clear cache to force reload of scholarships
  /// Useful for testing or when you know the data has changed
  void clearCache() {
    _cachedScholarships = null;
  }
}
