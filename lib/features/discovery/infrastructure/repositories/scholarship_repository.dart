import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../../core/db/database.dart' as db;
import '../../domain/i_scholarship_repository.dart';
import '../../domain/models/scholarship.dart';
import '../../domain/models/scholarship_filter.dart';
import '../../domain/models/scholarship_match.dart';
import '../data_sources/scholarship_dao.dart';

/// Single implementation of IScholarshipRepository combining hybrid approach
/// This consolidates discovery feed optimization with detailed scholarship loading
/// Following Clean Architecture: Infrastructure layer implements "HOW"
class ScholarshipRepository implements IScholarshipRepository {
  final db.AppDatabase _database;
  late final ScholarshipDao _dao;

  // Caching for performance optimization
  List<ScholarshipCardData>? _cachedCardData;
  final Map<String, Scholarship> _cachedDetailScholarships = {};

  // Asset paths for hybrid approach
  static const String _scholarshipsBasePath = 'assets/scholarships/';

  ScholarshipRepository(this._database) {
    _dao = ScholarshipDao(_database);
  }

  // ============================================================================
  // CORE SCHOLARSHIP OPERATIONS
  // ============================================================================

  @override
  Stream<List<Scholarship>> watchAllScholarships() {
    return _dao.watchAllScholarships().map((dbScholarships) {
      // Convert database scholarships to domain scholarships
      return dbScholarships.map(_convertDbToDomainScholarship).toList();
    });
  }

  @override
  Stream<List<Scholarship>> watchFilteredScholarships(
    ScholarshipFilter filter,
  ) {
    // For now, use the basic watchAllScholarships and filter in memory
    // TODO: Implement proper filtered watching in DAO
    return _dao.watchAllScholarships().map((dbScholarships) {
      // Apply basic filtering - this should be moved to DAO for performance
      return dbScholarships
          .where((s) {
            if (filter.searchQuery.isNotEmpty) {
              return s.title.toLowerCase().contains(
                filter.searchQuery.toLowerCase(),
              );
            }
            return true;
          })
          .map(_convertDbToDomainScholarship)
          .toList();
    });
  }

  @override
  Future<Scholarship?> getScholarshipById(String scholarshipId) async {
    // Check cache first
    if (_cachedDetailScholarships.containsKey(scholarshipId)) {
      return _cachedDetailScholarships[scholarshipId];
    }

    try {
      // Load from individual JSON file for rich details
      final String content = await rootBundle.loadString(
        '$_scholarshipsBasePath$scholarshipId.json',
      );
      final Map<String, dynamic> json = jsonDecode(content);
      final scholarship = Scholarship.fromJson(json);

      // Cache for future requests
      _cachedDetailScholarships[scholarshipId] = scholarship;
      return scholarship;
    } catch (e) {
      print('Error loading scholarship details for $scholarshipId: $e');
      return null;
    }
  }

  @override
  Stream<List<Scholarship>> searchScholarships(String query) async* {
    final scholarships = await _dao.searchScholarships(query);
    yield scholarships.map(_convertDbToDomainScholarship).toList();
  }

  // ============================================================================
  // DISCOVERY FEED OPERATIONS (Optimized for Instagram-like UI)
  // ============================================================================

  @override
  Future<List<ScholarshipCardData>> getScholarshipCards({
    ScholarshipFilter? filter,
    int? limit,
    int? offset,
  }) async {
    try {
      // Load optimized index data if not cached
      _cachedCardData ??= await _loadScholarshipIndex();

      List<ScholarshipCardData> results = List.from(_cachedCardData!);

      // Apply filtering
      if (filter != null) {
        results = _applyFilterToCardData(results, filter);
      }

      // Apply pagination
      if (offset != null) {
        results = results.skip(offset).toList();
      }
      if (limit != null) {
        results = results.take(limit).toList();
      }

      return results;
    } catch (e) {
      print('Error loading scholarship cards: $e');
      return [];
    }
  }

  @override
  Future<List<ScholarshipCardData>> searchScholarshipCards(String query) async {
    _cachedCardData ??= await _loadScholarshipIndex();

    final lowerQuery = query.toLowerCase();
    return _cachedCardData!.where((card) {
      return card.title.toLowerCase().contains(lowerQuery) ||
          card.provider.toLowerCase().contains(lowerQuery) ||
          card.quickTags.any((tag) => tag.toLowerCase().contains(lowerQuery));
    }).toList();
  }

  // ============================================================================
  // USER INTERACTION OPERATIONS
  // ============================================================================

  @override
  Future<void> saveScholarship(int userId, String scholarshipId) async {
    final scholarship = await _dao.getScholarshipByJsonId(scholarshipId);
    if (scholarship != null) {
      await _dao.saveScholarship(userId, scholarship.id);
    }
  }

  @override
  Future<void> unsaveScholarship(int userId, String scholarshipId) async {
    final scholarship = await _dao.getScholarshipByJsonId(scholarshipId);
    if (scholarship != null) {
      await _dao.unsaveScholarship(userId, scholarship.id);
    }
  }

  @override
  Future<bool> isScholarshipSaved(int userId, String scholarshipId) async {
    final scholarship = await _dao.getScholarshipByJsonId(scholarshipId);
    if (scholarship == null) return false;
    return _dao.isScholarshipSaved(userId, scholarship.id);
  }

  @override
  Stream<List<String>> watchSavedScholarshipIds(int userId) {
    // TODO: Implement watching saved scholarship IDs
    return Stream.value([]);
  }

  // ============================================================================
  // MATCHING & PERSONALIZATION
  // ============================================================================

  @override
  Stream<List<ScholarshipMatch>> watchScholarshipMatches(
    int userId,
    ScholarshipFilter? filter,
  ) {
    // TODO: Implement scholarship matching algorithm
    return Stream.value([]);
  }

  @override
  Stream<List<ScholarshipCardData>> watchTrendingScholarships(int userId) {
    // TODO: Implement trending algorithm
    return Stream.value([]);
  }

  @override
  Stream<List<ScholarshipCardData>> watchUpcomingDeadlines(
    int userId,
    int daysAhead,
  ) {
    // TODO: Implement deadline filtering
    return Stream.value([]);
  }

  // ============================================================================
  // APPLICATION PLANNING
  // ============================================================================

  @override
  Future<void> addToApplicationPlan(int userId, String scholarshipId) async {
    // For now, treat application plan same as saved scholarships
    await saveScholarship(userId, scholarshipId);
  }

  @override
  Future<void> removeFromApplicationPlan(
    int userId,
    String scholarshipId,
  ) async {
    // For now, treat application plan same as saved scholarships
    await unsaveScholarship(userId, scholarshipId);
  }

  @override
  Stream<List<ScholarshipCardData>> watchApplicationPlan(int userId) {
    // TODO: Implement application plan watching
    return Stream.value([]);
  }

  // ============================================================================
  // ANALYTICS & STATISTICS
  // ============================================================================

  @override
  Future<int> getScholarshipCount(ScholarshipFilter? filter) {
    return _dao.getScholarshipsCount(filter: filter);
  }

  @override
  Future<Map<String, dynamic>> getScholarshipStats() async {
    final totalCount = await _dao.getScholarshipsCount();
    return {
      'totalScholarships': totalCount,
      'activeScholarships': totalCount,
      'categories': {},
    };
  }

  @override
  Future<bool> scholarshipExists(String scholarshipId) async {
    try {
      await rootBundle.loadString('$_scholarshipsBasePath$scholarshipId.json');
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<String>> getAvailableScholarshipIds() async {
    // TODO: Implement by reading asset manifest or hardcoded list
    return ['fulbright_masters_2025', 'chevening_2025', 'lpdp_s2_2025'];
  }

  // ============================================================================
  // PRIVATE HELPER METHODS
  // ============================================================================

  /// Load optimized scholarship index for fast discovery feed
  Future<List<ScholarshipCardData>> _loadScholarshipIndex() async {
    try {
      // For now, return empty list until ScholarshipCardData has fromJson
      // TODO: Implement fromJson for ScholarshipCardData or manual parsing
      return [];
    } catch (e) {
      print('Error loading scholarship index: $e');
      return [];
    }
  }

  /// Apply filter criteria to card data
  List<ScholarshipCardData> _applyFilterToCardData(
    List<ScholarshipCardData> cards,
    ScholarshipFilter filter,
  ) {
    return cards.where((card) {
      // Apply funding type filter
      if (filter.fundingType != null &&
          filter.fundingType != FundingTypeFilter.all) {
        final expectedFunding =
            filter.fundingType == FundingTypeFilter.fullFunding
            ? 'Full Scholarship'
            : 'Partial Scholarship';
        if (card.fundingType != expectedFunding) return false;
      }

      // Apply search query filter
      if (filter.searchQuery.isNotEmpty) {
        final query = filter.searchQuery.toLowerCase();
        if (!card.title.toLowerCase().contains(query) &&
            !card.provider.toLowerCase().contains(query)) {
          return false;
        }
      }

      // Apply education level filter
      if (filter.educationLevels.isNotEmpty) {
        if (!filter.educationLevels.contains(card.degreeLevel)) {
          return false;
        }
      }

      // Apply country filter
      if (filter.targetCountries.isNotEmpty) {
        if (!filter.targetCountries.contains(card.providerCountry)) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  /// Convert database scholarship to domain scholarship
  /// This is a placeholder - implement based on your database schema
  Scholarship _convertDbToDomainScholarship(dynamic dbScholarship) {
    // TODO: Implement conversion from database scholarship to domain model
    // This would parse the fullData JSON field back to Scholarship domain model
    throw UnimplementedError(
      'Database to domain conversion not yet implemented',
    );
  }

  /// Clear all caches (useful for testing or when data changes)
  void clearCaches() {
    _cachedCardData = null;
    _cachedDetailScholarships.clear();
  }
}
