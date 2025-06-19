import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'template_browser_providers.g.dart';

// This provider streams the list of all scholarship templates from the repository.
// The UI will watch this to display the list.
@riverpod
Stream<List<ScholarshipTemplate>> allTemplates(Ref ref) {
  final repo = ref.watch(scholarshipTemplateRepositoryProvider);
  return repo.watchAllTemplates();
}
