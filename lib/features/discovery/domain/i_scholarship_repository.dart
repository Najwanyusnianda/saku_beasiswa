import 'models/scholarship.dart';
import 'models/scholarship_filter.dart';
import 'models/scholarship_match.dart';

/// Single repository interface for all scholarship-related operations
/// This defines the contract for scholarship data access without implementation details
/// Following Clean Architecture: Domain layer defines "WHAT" without "HOW"
abstract class IScholarshipRepository {
  // ============================================================================
  // CORE SCHOLARSHIP OPERATIONS
  // ============================================================================

  /// Watch all scholarships with reactive updates
  Stream<List<Scholarship>> watchAllScholarships();

  /// Watch scholarships filtered by criteria with reactive updates
  Stream<List<Scholarship>> watchFilteredScholarships(ScholarshipFilter filter);

  /// Get a single scholarship by its ID (for detail screen)
  Future<Scholarship?> getScholarshipById(String scholarshipId);

  /// Search scholarships by text query with reactive results
  Stream<List<Scholarship>> searchScholarships(String query);

  // ============================================================================
  // DISCOVERY FEED OPERATIONS (Fast loading for Instagram-like UI)
  // ============================================================================

  /// Get scholarship card data for efficient list rendering (discovery feed)
  /// This should use optimized data loading for performance
  Future<List<ScholarshipCardData>> getScholarshipCards({
    ScholarshipFilter? filter,
    int? limit,
    int? offset,
  });

  /// Search scholarship cards by query (fast discovery search)
  Future<List<ScholarshipCardData>> searchScholarshipCards(String query);

  // ============================================================================
  // USER INTERACTION OPERATIONS
  // ============================================================================

  /// Save/bookmark a scholarship for a user
  Future<void> saveScholarship(int userId, String scholarshipId);

  /// Remove a scholarship from user's saved list
  Future<void> unsaveScholarship(int userId, String scholarshipId);

  /// Check if a scholarship is saved by a user
  Future<bool> isScholarshipSaved(int userId, String scholarshipId);

  /// Watch all saved scholarship IDs for a user with reactive updates
  Stream<List<String>> watchSavedScholarshipIds(int userId);

  // ============================================================================
  // MATCHING & PERSONALIZATION
  // ============================================================================

  /// Get scholarship matches for a specific user profile
  /// This combines scholarships with calculated match scores
  Stream<List<ScholarshipMatch>> watchScholarshipMatches(
    int userId,
    ScholarshipFilter? filter,
  );

  /// Get trending/popular scholarships for discovery
  Stream<List<ScholarshipCardData>> watchTrendingScholarships(int userId);

  /// Get scholarships with upcoming deadlines
  Stream<List<ScholarshipCardData>> watchUpcomingDeadlines(
    int userId,
    int daysAhead,
  );

  // ============================================================================
  // APPLICATION PLANNING
  // ============================================================================

  /// Add scholarship to application plan (for application tracking)
  Future<void> addToApplicationPlan(int userId, String scholarshipId);

  /// Remove scholarship from application plan
  Future<void> removeFromApplicationPlan(int userId, String scholarshipId);

  /// Watch scholarships in user's application plan
  Stream<List<ScholarshipCardData>> watchApplicationPlan(int userId);

  // ============================================================================
  // ANALYTICS & STATISTICS
  // ============================================================================

  /// Get count of scholarships matching filter criteria
  Future<int> getScholarshipCount(ScholarshipFilter? filter);

  /// Get scholarship statistics for dashboard/insights
  Future<Map<String, dynamic>> getScholarshipStats();

  /// Check if a scholarship detail exists (for error handling)
  Future<bool> scholarshipExists(String scholarshipId);

  /// Get available scholarship IDs (for debugging/admin)
  Future<List<String>> getAvailableScholarshipIds();
}
