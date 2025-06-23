//lib/features/templates/presentation/providers/template_browser_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/core/models/full_scholarship_template_with_milestones.dart';
part 'template_browser_providers.g.dart';

//
@riverpod
Stream<List<ScholarshipTemplate>> allTemplates(Ref ref) {
  final repo = ref.watch(scholarshipTemplateRepositoryProvider);
  return repo.watchAllTemplates();
}


// @riverpod
// Future<FullScholarshipTemplate> templateDetail(Ref ref, String templateId) {
//   final repo = ref.watch(scholarshipTemplateRepositoryProvider);
//   return repo.getFullTemplateById(templateId);
// }

@riverpod
Future<FullScholarshipTemplateWithMilestones> templateDetail(
  Ref ref,
  String templateId,
) {
  final repo = ref.watch(scholarshipTemplateRepositoryProvider);
  // Call the new repository method
  return repo.getFullTemplateWithMilestones(templateId);
}