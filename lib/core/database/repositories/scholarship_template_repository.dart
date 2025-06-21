import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/user_profile_repository.dart';
import 'package:saku_beasiswa/features/profile/data/profile_setup_form_model.dart';
part 'scholarship_template_repository.g.dart';

// New data class to hold the complete template information
class FullScholarshipTemplate {
  final ScholarshipTemplate template;
  final List<TemplateTask> tasks;
  final List<TemplateDocument> documents;

  FullScholarshipTemplate({
    required this.template,
    required this.tasks,
    required this.documents,
  });
}

class ScholarshipTemplateRepository {
  final AppDatabase _db;
  ScholarshipTemplateRepository(this._db);

  // This method to get the list of templates for the Discover screen is largely unchanged
  Stream<List<ScholarshipTemplate>> watchAllTemplates() {
    return _db.select(_db.scholarshipTemplates).watch();
  }

  // Finds templates that match the criteria from the user's profile.
  // TODO: Implement actual matching logic based on the profile.
  Future<List<ScholarshipTemplate>> findMatchingTemplates(ProfileSetupFormModel profile) async {
    // For now, this returns all templates. You should add logic here to filter
    // templates based on the user's GPA, field of study, etc.
    return _db.select(_db.scholarshipTemplates).get();
  }

  // --- NEW METHOD ---
  // Fetches a template and all its related tasks and documents
  Future<FullScholarshipTemplate> getFullTemplateById(String id) async {
    // 1. Fetch the main template
    final template = await (_db.select(_db.scholarshipTemplates)..where((tbl) => tbl.id.equals(id))).getSingle();
    
    // 2. Fetch the related tasks
    final tasks = await (_db.select(_db.templateTasks)..where((tbl) => tbl.templateId.equals(id))).get();

    // 3. Fetch the related documents
    final documents = await (_db.select(_db.templateDocuments)..where((tbl) => tbl.templateId.equals(id))).get();

    return FullScholarshipTemplate(
      template: template,
      tasks: tasks,
      documents: documents,
    );
  }
}

@riverpod
ScholarshipTemplateRepository scholarshipTemplateRepository(Ref ref) {
  return ScholarshipTemplateRepository(ref.watch(appDatabaseProvider));
}
