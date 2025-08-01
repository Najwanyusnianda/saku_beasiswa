import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/db/database.dart';
import '../../../../core/db/tables/scholarships_table.dart';
import '../../../../core/db/tables/user_saved_scholarships_table.dart';
import '../../domain/models/scholarship_filter.dart';

part 'scholarship_dao.g.dart';

/// Data Access Object for scholarship operations
/// Handles all database interactions for the discovery feature
@DriftAccessor(tables: [Scholarships, UserSavedScholarships])
class ScholarshipDao extends DatabaseAccessor<AppDatabase>
    with _$ScholarshipDaoMixin {
  ScholarshipDao(super.db);

  /// Get paginated scholarships with optional filtering
  Future<List<Scholarship>> getScholarships({
    ScholarshipFilter? filter,
    int limit = 20,
    int offset = 0,
  }) async {
    final query = select(scholarships);

    // Apply filters using reusable condition
    if (filter != null) {
      final condition = buildFilterCondition(filter);
      query.where((tbl) => condition); // ✅ Wrap in function
    }

    // Apply pagination
    query.limit(limit, offset: offset);

    // Apply sorting
    _applySortingToQuery(query, filter);

    return query.get();
  }

  /// Get a single scholarship by ID
  Future<Scholarship?> getScholarshipById(int id) {
    return (select(
      scholarships,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Get a single scholarship by JSON ID
  Future<Scholarship?> getScholarshipByJsonId(String jsonId) {
    return (select(
      scholarships,
    )..where((tbl) => tbl.jsonId.equals(jsonId))).getSingleOrNull();
  }

  /// Watch saved scholarships for a user
  Stream<List<Scholarship>> watchSavedScholarships(int userId) {
    final query = select(scholarships).join([
      innerJoin(
        userSavedScholarships,
        userSavedScholarships.scholarshipId.equalsExp(scholarships.id),
      ),
    ])..where(userSavedScholarships.userId.equals(userId));

    return query.watch().map((rows) {
      return rows.map((row) => row.readTable(scholarships)).toList();
    });
  }

  /// Save a scholarship for later
  Future<void> saveScholarship(int userId, int scholarshipId) {
    return into(userSavedScholarships).insert(
      UserSavedScholarshipsCompanion.insert(
        userId: userId,
        scholarshipId: scholarshipId,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  /// Remove a saved scholarship
  Future<void> unsaveScholarship(int userId, int scholarshipId) {
    return (delete(userSavedScholarships)..where(
          (tbl) =>
              tbl.userId.equals(userId) &
              tbl.scholarshipId.equals(scholarshipId),
        ))
        .go();
  }

  /// Check if a scholarship is saved
  Future<bool> isScholarshipSaved(int userId, int scholarshipId) async {
    final result =
        await (select(userSavedScholarships)..where(
              (tbl) =>
                  tbl.userId.equals(userId) &
                  tbl.scholarshipId.equals(scholarshipId),
            ))
            .getSingleOrNull();
    return result != null;
  }

  /// Get total count of scholarships matching the filter
  Future<int> getScholarshipsCount({ScholarshipFilter? filter}) async {
    final query = selectOnly(scholarships)
      ..addColumns([scholarships.id.count()]);

    if (filter != null) {
      final condition = buildFilterCondition(filter);
      query.where(condition);
    }

    final result = await query.getSingle();
    return result.read(scholarships.id.count()) ?? 0;
  }

  /// Watch all scholarships (useful for real-time updates)
  Stream<List<Scholarship>> watchAllScholarships() {
    return select(scholarships).watch();
  }

  Stream<List<Scholarship>> watchFilteredScholarships(
    ScholarshipFilter filter,
  ) {
    final query = select(scholarships);

    final condition = buildFilterCondition(filter);
    query.where((tbl) => condition);
    _applySortingToQuery(query, filter);

    return query.watch();
  }

  Future<List<Scholarship>> searchScholarships(String query) async {
    final queryBuilder = select(scholarships)
      ..where((tbl) => tbl.title.contains(query) | tbl.provider.contains(query))
      ..orderBy([
        (tbl) => OrderingTerm(
          expression: tbl.applicationDeadline,
          mode: OrderingMode.asc,
        ),
      ]);

    final results = await queryBuilder.get();
    return results;
  }

  /// Builds a reusable WHERE condition based on the filter.
  /// Can be used across multiple queries (select, count, etc.)
  Expression<bool> buildFilterCondition(ScholarshipFilter filter) {
    final conditions = <Expression<bool>>[];

    // Funding type filter
    if (filter.fundingType != null &&
        filter.fundingType != FundingTypeFilter.all) {
      final fundingValue = filter.fundingType == FundingTypeFilter.fullFunding
          ? 'full'
          : 'partial';
      conditions.add(scholarships.fundingType.equals(fundingValue));
    }

    // Education levels: filter JSON string array using LIKE
    if (filter.educationLevels.isNotEmpty) {
      final levelConditions = filter.educationLevels
          .map((level) => scholarships.targetDegreeLevels.like('%"$level"%'))
          .reduce((a, b) => a | b); //
      conditions.add(levelConditions);
    }

    // Search query: match title or provider
    if (filter.searchQuery.isNotEmpty) {
      conditions.add(
        scholarships.title.contains(filter.searchQuery) |
            scholarships.provider.contains(filter.searchQuery),
      );
    }

    // Combine all conditions with AND, or return true if none
    return conditions.isEmpty
        ? const Constant<bool>(true)
        : conditions.reduce((a, b) => a & b);
  }

  /// Apply sorting to the query
  void _applySortingToQuery(
    SimpleSelectStatement<$ScholarshipsTable, Scholarship> query,
    ScholarshipFilter? filter,
  ) {
    final sortOption = filter?.sortBy ?? SortOption.deadline;
    final sortDirection = filter?.sortDirection ?? SortDirection.descending;
    final mode = sortDirection == SortDirection.ascending
        ? OrderingMode.asc
        : OrderingMode.desc;

    switch (sortOption) {
      case SortOption.deadline:
        query.orderBy([
          (tbl) =>
              OrderingTerm(expression: tbl.applicationDeadline, mode: mode),
        ]);
        break;
      case SortOption.alphabetical:
        query.orderBy([
          (tbl) => OrderingTerm(expression: tbl.title, mode: mode),
        ]);
        break;
      // Match score and funding amount require additional logic
      // Defaulting to deadline ascending
      case SortOption.matchScore:
      case SortOption.fundingAmount:
      default:
        query.orderBy([
          (tbl) => OrderingTerm(
            expression: tbl.applicationDeadline,
            mode: OrderingMode.asc,
          ),
        ]);
    }
  }
}
