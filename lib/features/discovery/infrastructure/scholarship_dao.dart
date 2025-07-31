import 'package:drift/drift.dart';
import '../../../core/db/database.dart';
import '../../../core/db/tables/scholarships_table.dart';
import '../../../core/db/tables/user_saved_scholarships_table.dart';
import '../domain/models/scholarship_filter.dart';

part 'scholarship_dao.g.dart';

/// Data Access Object for scholarship operations
/// Handles all database interactions for the discovery feature
@DriftAccessor(tables: [Scholarships, UserSavedScholarships])
class ScholarshipDao extends DatabaseAccessor<AppDatabase> with _$ScholarshipDaoMixin {
  ScholarshipDao(super.db);

  /// Get paginated scholarships with optional filtering
  Future<List<Scholarship>> getScholarships({
    ScholarshipFilter? filter,
    int limit = 20,
    int offset = 0,
  }) async {
    final query = select(attachedDatabase.scholarships);

    // Apply filters
    if (filter != null) {
      // Apply funding type filter
      if (filter.fundingType != null && filter.fundingType != FundingTypeFilter.all) {
        String fundingValue = filter.fundingType == FundingTypeFilter.fullFunding 
            ? 'Full Scholarship' 
            : 'Partial Scholarship';
        query.where((tbl) => tbl.fundingType.equals(fundingValue));
      }
      
      // Apply education level filter
      if (filter.educationLevels.isNotEmpty) {
        query.where((tbl) => tbl.targetDegreeLevels.contains(filter.educationLevels.first));
      }
      
      // Apply target countries filter
      if (filter.targetCountries.isNotEmpty) {
        query.where((tbl) => tbl.studyCountries.contains(filter.targetCountries.first));
      }
      
      // Apply subject areas filter
      if (filter.subjectAreas.isNotEmpty) {
        query.where((tbl) => tbl.subjectAreas.contains(filter.subjectAreas.first));
      }
      
      // Apply search query
      if (filter.searchQuery.isNotEmpty) {
        query.where((tbl) => 
          tbl.title.contains(filter.searchQuery) |
          tbl.provider.contains(filter.searchQuery)
        );
      }
      
      // Apply GPA filters
      if (filter.minGpa != null) {
        query.where((tbl) => tbl.minGpa.isSmallerOrEqualValue(filter.minGpa!));
      }
      if (filter.maxGpa != null) {
        query.where((tbl) => tbl.minGpa.isBiggerOrEqualValue(filter.maxGpa!));
      }
    }

    // Apply pagination
    query.limit(limit, offset: offset);
    
    // Apply sorting based on sortBy option
    switch (filter?.sortBy ?? SortOption.matchScore) {
      case SortOption.deadline:
        query.orderBy([(tbl) => filter?.sortDirection == SortDirection.ascending 
            ? OrderingTerm.asc(tbl.applicationDeadline)
            : OrderingTerm.desc(tbl.applicationDeadline)]);
        break;
      case SortOption.alphabetical:
        query.orderBy([(tbl) => filter?.sortDirection == SortDirection.ascending 
            ? OrderingTerm.asc(tbl.title)
            : OrderingTerm.desc(tbl.title)]);
        break;
      case SortOption.newest:
        query.orderBy([(tbl) => filter?.sortDirection == SortDirection.ascending 
            ? OrderingTerm.asc(tbl.createdAt)
            : OrderingTerm.desc(tbl.createdAt)]);
        break;
      case SortOption.matchScore:
      case SortOption.fundingAmount:
        // For now, default to deadline sorting until we implement match scoring
        query.orderBy([(tbl) => OrderingTerm.desc(tbl.applicationDeadline)]);
    }

    return query.get();
  }

  /// Get a single scholarship by ID
  Future<Scholarship?> getScholarshipById(int id) {
    return (select(attachedDatabase.scholarships)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Get a single scholarship by JSON ID
  Future<Scholarship?> getScholarshipByJsonId(String jsonId) {
    return (select(attachedDatabase.scholarships)..where((tbl) => tbl.jsonId.equals(jsonId))).getSingleOrNull();
  }

  /// Search scholarships by query
  Future<List<Scholarship>> searchScholarships(String query, {int limit = 20}) {
    return (select(attachedDatabase.scholarships)
      ..where((tbl) => 
        tbl.title.contains(query) |
        tbl.provider.contains(query) |
        tbl.fundingType.contains(query)
      )
      ..limit(limit)
    ).get();
  }

  /// Get saved scholarships for a user
  Stream<List<Scholarship>> watchSavedScholarships(int userId) {
    final query = select(attachedDatabase.scholarships).join([
      innerJoin(
        attachedDatabase.userSavedScholarships,
        attachedDatabase.userSavedScholarships.scholarshipId.equalsExp(attachedDatabase.scholarships.id),
      ),
    ])..where(attachedDatabase.userSavedScholarships.userId.equals(userId));

    return query.watch().map((rows) => 
      rows.map((row) => row.readTable(attachedDatabase.scholarships)).toList()
    );
  }

  /// Save a scholarship for later
  Future<void> saveScholarship(int userId, int scholarshipId) {
    return into(attachedDatabase.userSavedScholarships).insert(
      UserSavedScholarshipsCompanion.insert(
        userId: userId,
        scholarshipId: scholarshipId,
      ),
    );
  }

  /// Remove a saved scholarship
  Future<void> unsaveScholarship(int userId, int scholarshipId) {
    return (delete(attachedDatabase.userSavedScholarships)
      ..where((tbl) => 
        tbl.userId.equals(userId) & 
        tbl.scholarshipId.equals(scholarshipId)
      )
    ).go();
  }

  /// Check if a scholarship is saved
  Future<bool> isScholarshipSaved(int userId, int scholarshipId) async {
    final result = await (select(attachedDatabase.userSavedScholarships)
      ..where((tbl) => 
        tbl.userId.equals(userId) & 
        tbl.scholarshipId.equals(scholarshipId)
      )
    ).getSingleOrNull();
    
    return result != null;
  }

  /// Get scholarships count by filter
  Future<int> getScholarshipsCount({ScholarshipFilter? filter}) async {
    final query = selectOnly(attachedDatabase.scholarships)..addColumns([attachedDatabase.scholarships.id.count()]);

    if (filter != null) {
      // Apply funding type filter
      if (filter.fundingType != null && filter.fundingType != FundingTypeFilter.all) {
        String fundingValue = filter.fundingType == FundingTypeFilter.fullFunding 
            ? 'Full Scholarship' 
            : 'Partial Scholarship';
        query.where(attachedDatabase.scholarships.fundingType.equals(fundingValue));
      }
      
      // Apply search query
      if (filter.searchQuery.isNotEmpty) {
        query.where(
          attachedDatabase.scholarships.title.contains(filter.searchQuery) |
          attachedDatabase.scholarships.provider.contains(filter.searchQuery)
        );
      }
    }

    final result = await query.getSingle();
    return result.read(attachedDatabase.scholarships.id.count()) ?? 0;
  }

  /// Watch all scholarships
  Stream<List<Scholarship>> watchAllScholarships() {
    return select(attachedDatabase.scholarships).watch();
  }

  /// Watch filtered scholarships
  Stream<List<Scholarship>> watchFilteredScholarships(ScholarshipFilter filter) {
    final query = select(attachedDatabase.scholarships);
    
    // Apply same filters as getScholarships
    if (filter.fundingType != null && filter.fundingType != FundingTypeFilter.all) {
      String fundingValue = filter.fundingType == FundingTypeFilter.fullFunding 
          ? 'Full Scholarship' 
          : 'Partial Scholarship';
      query.where((tbl) => tbl.fundingType.equals(fundingValue));
    }
    
    if (filter.searchQuery.isNotEmpty) {
      query.where((tbl) => 
        tbl.title.contains(filter.searchQuery) |
        tbl.provider.contains(filter.searchQuery)
      );
    }
    
    return query.watch();
  }
}
