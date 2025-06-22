// lib/features/applications/presentation/providers/my_applications_provider.dart

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:saku_beasiswa/features/applications/domain/timeline_event.dart';
import 'package:flutter/material.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'my_applications_provider.g.dart';


// --- TAMBAHKAN ENUM INI DI ATAS ---
// Enum untuk merepresentasikan status dengan lebih aman daripada String
enum ApplicationStatus {
  onTrack(label: 'On Track', color: AppColors.success),
  atRisk(label: 'At Risk', color: AppColors.warning),
  overdue(label: 'Overdue', color: AppColors.error);

  const ApplicationStatus({required this.label, required this.color});
  final String label;
  final Color color;
}


@riverpod
ApplicationStatus applicationStatus(Ref ref, int applicationId) {
  // Ambil data aplikasi dan tugasnya
  final appDetail = ref.watch(applicationDetailProvider(applicationId));
  final tasks = ref.watch(applicationTasksProvider(applicationId));

  // Handle saat data masih loading
  if (appDetail.isLoading || tasks.isLoading) {
    return ApplicationStatus.onTrack; // Default status
  }

  // Handle jika ada error
  if (appDetail.hasError || tasks.hasError) {
    return ApplicationStatus.onTrack;
  }

  final application = appDetail.value!.application;
  final taskList = tasks.value!;

  // --- Aturan Logika Status ---
  
  // 1. Cek apakah ada tugas yang overdue
  final now = DateTime.now();
  final hasOverdueTask = taskList.any((task) =>
      task.status == 'pending' &&
      task.dueDate != null &&
      task.dueDate!.isBefore(now));

  if (hasOverdueTask) {
    return ApplicationStatus.overdue;
  }

  // 2. Jika tidak ada yang overdue, cek apakah deadline utama sudah dekat
  final daysUntilDeadline = application.deadline.difference(now).inDays;
  if (daysUntilDeadline <= 14) {
    return ApplicationStatus.atRisk;
  }

  // 3. Jika semua aman, statusnya On Track
  return ApplicationStatus.onTrack;
}
// Streams the list of all applications with their template info.
@riverpod
Stream<List<ApplicationWithTemplate>> myApplications(Ref ref) {
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.watchAllApplications();
}

// The ".family" modifier allows us to pass a parameter (the ID) to the provider.
// Riverpod will automatically manage separate states for each ID.
@riverpod
Stream<ApplicationWithTemplate> applicationDetail(Ref ref, int id) {
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.watchApplicationById(id);
}



// Streams the list of tasks for a specific application
@riverpod
Stream<List<Task>> applicationTasks(Ref ref, int applicationId) {
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.watchTasksForApplication(applicationId);
}

// --- PROVIDER BARU ---
// Mengambil tugas mendesak berikutnya untuk sebuah aplikasi
@riverpod
Future<Task?> nextUpcomingTask(Ref ref, int applicationId) {
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.getNextUpcomingTask(applicationId);
}


// This provider combines data from the application and its tasks to build a timeline.
@riverpod
Future<List<TimelineEvent>> applicationTimeline(Ref ref, int applicationId) async {
  // Watch both the application details and its tasks.
    // If your providers are async, await them
  final appDetail = await ref.watch(applicationDetailProvider(applicationId).future);
  final tasks = await ref.watch(applicationTasksProvider(applicationId).future);
  
    final List<TimelineEvent> events = [];

    // 1. Add application creation event
    events.add(TimelineEvent(
      title: 'Application Started',
      date: appDetail.application.createdAt,
      type: TimelineEventType.milestone,
      isCompleted: true, // This event is always completed
      icon: Iconsax.play_circle,
    ));

    // 2. Add events for tasks that have a due date
    for (final task in tasks) {
      if (task.dueDate != null) {
        events.add(TimelineEvent(
          title: task.title,
          date: task.dueDate!,
          type: TimelineEventType.task,
          isCompleted: task.status == 'completed',
          icon: Iconsax.document_text_1,
        ));
      }
    }
    
    // 3. Add application deadline event
    events.add(TimelineEvent(
      title: 'Application Deadline',
      date: appDetail.application.deadline,
      type: TimelineEventType.milestone,
      isCompleted: DateTime.now().isAfter(appDetail.application.deadline),
      icon: Iconsax.flag,
    ));

    // Sort all events by date
    events.sort((a, b) => a.date.compareTo(b.date));

    // 'yield' emits the new list of events to the stream's listeners.
    return events;
  
}

// This provider watches the list of tasks for an application and calculates
// the completion percentage. It's a `.family` provider because it depends on the application ID.
@riverpod
Stream<double> applicationCompletionPercentage(
  Ref ref,
  int applicationId,
) {
  // Watch the tasks for the given application.
  final tasksStream = ref.watch(applicationTasksProvider(applicationId).stream);
  
  // Use .map() to transform the stream of List<Task> into a stream of double (percentage).
  return tasksStream.map((tasks) {
    if (tasks.isEmpty) {
      return 0.0; // If there are no tasks, completion is 0%.
    }
    
    // Count how many tasks are marked 'completed'.
    final completedTasks = tasks.where((task) => task.status == 'completed').length;
    
    // Calculate the percentage.
    return completedTasks / tasks.length;
  });
}