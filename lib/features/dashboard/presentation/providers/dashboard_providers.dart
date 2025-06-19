// lib/features/dashboard/presentation/providers/dashboard_providers.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'dashboard_providers.g.dart';

// Provider for the count of active applications.
// It will automatically update when an application is added or its status changes.
@riverpod
Stream<int> activeApplicationsCount(Ref ref) {
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.watchActiveApplicationsCount();
}

// Provider for the next upcoming deadline.
// It watches the database for changes and returns the application with the closest deadline.
@riverpod
Stream<Application?> nextDeadline(Ref ref) {
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.watchNextDeadline();
}

// Provider for the list of tasks for "Today's Focus".
// It returns a stream of the top 3 most urgent tasks.
@riverpod
Stream<List<Task>> todaysFocusTasks(Ref ref) {
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.watchTodaysFocusTasks();
}