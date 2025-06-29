//lib/features/templates/presentation/providers/template_browser_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/core/models/full_template_plan.dart';
part 'template_browser_providers.g.dart';

//
@riverpod
Stream<List<ScholarshipTemplate>> allTemplates(Ref ref) {
  final repo = ref.watch(scholarshipTemplateRepositoryProvider);
  return repo.watchAllTemplates();
}


// This provider MUST return Future<FullTemplatePlan>
@riverpod
Future<FullTemplatePlan> templateDetail(Ref ref, String templateId) {
  final repo = ref.watch(scholarshipTemplateRepositoryProvider);
  // It MUST call the correct repository method
  return repo.getFullTemplatePlanById(templateId);
}