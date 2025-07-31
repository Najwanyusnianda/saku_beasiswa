import '../models/scholarship.dart';
import '../models/scholarship_filter.dart';
import '../models/scholarship_match.dart';

/// Repository interface for scholarship discovery functionality
/// This defines the contract for scholarship data access without implementation details
abstract class IScholarshipRepository {
  /// Watch all scholarships with optional filtering
  Stream<List<Scholarship>> watchAllScholarships();

  /// Watch scholarships filtered by criteria
  Stream<List<Scholarship>> watchFilteredScholarships(ScholarshipFilter filter);

  /// Get a single scholarship by its ID
  Future<Scholarship?> getScholarshipById(String scholarshipId);

  /// Get scholarship matches for a specific user profile
  /// This combines scholarships with calculated match scores
  Stream<List<ScholarshipMatch>> watchScholarshipMatches(
    int userId, 
    ScholarshipFilter? filter,
  );

  /// Get scholarship card data for efficient list rendering
  Stream<List<ScholarshipCardData>> watchScholarshipCards(
    int userId,
    ScholarshipFilter? filter,
  );

  /// Save/bookmark a scholarship for a user
  Future<void> saveScholarship(int userId, String scholarshipId);

  /// Remove a scholarship from user's saved list
  Future<void> unsaveScholarship(int userId, String scholarshipId);

  /// Check if a scholarship is saved by a user
  Future<bool> isScholarshipSaved(int userId, String scholarshipId);

  /// Watch all saved scholarship IDs for a user
  Stream<List<String>> watchSavedScholarshipIds(int userId);

  /// Get count of scholarships matching filter criteria
  Future<int> getScholarshipCount(ScholarshipFilter? filter);

  /// Get scholarship statistics for dashboard/insights
  Future<Map<String, dynamic>> getScholarshipStats();

  /// Search scholarships by text query
  Stream<List<Scholarship>> searchScholarships(String query);

  /// Get trending/popular scholarships
  Stream<List<ScholarshipCardData>> watchTrendingScholarships(int userId);

  /// Get scholarships with upcoming deadlines
  Stream<List<ScholarshipCardData>> watchUpcomingDeadlines(
    int userId, 
    int daysAhead,
  );

  /// Add scholarship to application plan (for application tracking)
  Future<void> addToApplicationPlan(int userId, String scholarshipId);

  /// Remove scholarship from application plan
  Future<void> removeFromApplicationPlan(int userId, String scholarshipId);

  /// Watch scholarships in user's application plan
  Stream<List<ScholarshipCardData>> watchApplicationPlan(int userId);
}
