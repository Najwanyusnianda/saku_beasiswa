// lib/features/dashboard/presentation/providers/dashboard_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';

part 'dashboard_providers.g.dart';

// --- NEW Data Class for Dashboard Tasks ---
// This holds a UserTask and its parent UserApplication and ScholarshipTemplate
class FocusTask {
  final UserTask task;
  final UserApplication application;
  final ScholarshipTemplate template;

  FocusTask({required this.task, required this.application, required this.template});
}

// --- REFACTORED PROVIDERS ---

// 1. Count of active applications
@riverpod
Stream<int> activeApplicationsCount(Ref ref) {
  // This needs a new method in the repository
  return ref.watch(applicationRepositoryProvider).watchActiveApplicationsCount();
}

// 2. Count of overdue tasks
@riverpod
Stream<int> overdueTasksCount(Ref ref) {
  // This needs a new method in the repository
  return ref.watch(applicationRepositoryProvider).watchOverdueTasksCount();
}

// 3. Next upcoming milestone deadline (more relevant than app deadline now)
@riverpod
Stream<UserMilestone?> nextMilestoneDeadline(Ref ref) {
  // This needs a new method in the repository
  return ref.watch(applicationRepositoryProvider).watchNextMilestoneDeadline();
}

// 4. Today's Focus Tasks (the main one)
@riverpod
Future<List<FocusTask>> todaysFocus(TodaysFocusRef ref) async {
  // This requires a new, powerful method in the repository
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.getTodaysFocusTasks();
}