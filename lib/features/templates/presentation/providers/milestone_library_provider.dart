// lib/features/templates/presentation/providers/milestone_library_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';

part 'milestone_library_provider.g.dart';

@riverpod
Future<List<MilestoneTemplate>> milestoneLibrary(Ref ref) {
  return ref.watch(scholarshipTemplateRepositoryProvider).getMilestoneLibrary();
}
