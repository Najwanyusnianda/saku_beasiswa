// lib/features/dashboard/presentation/providers/dashboard_providers.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/presentation/providers/my_applications_provider.dart';


part 'dashboard_providers.g.dart';


class TaskWithApplicationInfo {
  final Task task;
  final Application application;
  final ScholarshipTemplate template;

  TaskWithApplicationInfo({
    required this.task,
    required this.application,
    required this.template,
  });
}
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

// --- PROVIDER BARU ---
// Menghitung jumlah tugas yang sudah lewat tanggalnya tapi belum selesai
@riverpod
Stream<int> overdueTasksCount(Ref ref) {
  final repo = ref.watch(applicationRepositoryProvider);
  final now = DateTime.now();
  
  return repo.watchAllTasks().map((tasks) {
    return tasks.where((task) =>
      task.status == 'pending' &&
      task.dueDate != null &&
      task.dueDate!.isBefore(now)
    ).length;
  });
}

// --- PROVIDER YANG DIPERBARUI ---
// Mengambil tugas untuk "Today's Focus" lengkap dengan info beasiswanya
@riverpod
Stream<List<TaskWithApplicationInfo>> todaysFocus(Ref ref) async* {
  final repo = ref.watch(applicationRepositoryProvider);
  final sevenDaysFromNow = DateTime.now().add(const Duration(days: 7));

  // Ambil semua aplikasi dan tugas
  final allApps = await ref.watch(myApplicationsProvider.future);
  final allTasks = await repo.watchAllTasks().first;

  // Filter tugas yang relevan
  final focusTasks = allTasks.where((task) =>
    task.status == 'pending' &&
    task.dueDate != null &&
    task.dueDate!.isBefore(sevenDaysFromNow)
  ).toList();
  
  // Urutkan berdasarkan tanggal
  focusTasks.sort((a, b) => a.dueDate!.compareTo(b.dueDate!));

  // Gabungkan dengan info aplikasi
  final result = focusTasks.map((task) {
    final app = allApps.firstWhere((app) => app.application.id == task.applicationId);
    return TaskWithApplicationInfo(
      task: task,
      application: app.application,
      template: app.template
    );
  }).toList();
  
  yield result.take(3).toList(); // Ambil 3 teratas
}