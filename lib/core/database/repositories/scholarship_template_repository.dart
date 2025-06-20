import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';

class ScholarshipTemplateRepository {
  final AppDatabase _db;
  ScholarshipTemplateRepository(this._db);

  // Method to find matching templates based on a user's profile
  // Watches the entire templates table for changes.
  Stream<List<ScholarshipTemplate>> watchAllTemplates() {
    return _db.select(_db.scholarshipTemplates).watch();
  }

    // New method to get a single template by its ID
  Future<ScholarshipTemplate> getTemplateById(String id) async {
    return await (_db.select(_db.scholarshipTemplates)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<ScholarshipTemplate>> findMatchingTemplates(UserProfile profile) async {
    // Artificial delay to simulate a network call and show our loading animation
    await Future.delayed(const Duration(seconds: 3));

    if (profile.studyLevel == null || profile.fieldOfStudy == null) {
      // If profile is incomplete, return all templates
      return _db.select(_db.scholarshipTemplates).get();
    }


    // Build a dynamic query
    final query = _db.select(_db.scholarshipTemplates)
      ..where((tbl) {
        // Study Level check: "S2" is contained in "S1,S2,S3"
        final studyLevelMatch = tbl.studyLevels.like('%${profile.studyLevel!}%');
        // Field of study check: template is for 'All' OR contains the user's major
        final fieldOfStudyMatch = tbl.fieldsOfStudy.equals('All') | 
                                tbl.fieldsOfStudy.like('%${profile.fieldOfStudy!}%');
        
        return studyLevelMatch & fieldOfStudyMatch;
      });
    
    return query.get();
  }
}
