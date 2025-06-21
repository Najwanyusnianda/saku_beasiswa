import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';

part 'template_browser_providers.g.dart';

// This provider streams the list of all scholarship templates from the repository.
// The UI will watch this to display the list.
@riverpod
Stream<List<ScholarshipTemplate>> allTemplates(Ref ref) {
  final repo = ref.watch(scholarshipTemplateRepositoryProvider);
  return repo.watchAllTemplates();
}

// --- NEW PROVIDER ---
// Fetches the details for a single template.
// The ".family" modifier allows us to pass the ID as a parameter.
// --- UPDATED PROVIDER ---
// It now returns a Future of the complete FullScholarshipTemplate object
@riverpod
Future<FullScholarshipTemplate> templateDetail(Ref ref, String templateId) {
  final repo = ref.watch(scholarshipTemplateRepositoryProvider);
  // Call the correct method to get the template with its tasks and documents
  return repo.getFullTemplateById(templateId);
}