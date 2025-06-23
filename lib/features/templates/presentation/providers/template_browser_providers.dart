//lib/features/templates/presentation/providers/template_browser_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';

part 'template_browser_providers.g.dart';

//
@riverpod
Stream<List<ScholarshipTemplate>> allTemplates(Ref ref) {
  final repo = ref.watch(scholarshipTemplateRepositoryProvider);
  return repo.watchAllTemplates();
}


@riverpod
Future<FullScholarshipTemplate> templateDetail(Ref ref, String templateId) {
  final repo = ref.watch(scholarshipTemplateRepositoryProvider);
  return repo.getFullTemplateById(templateId);
}