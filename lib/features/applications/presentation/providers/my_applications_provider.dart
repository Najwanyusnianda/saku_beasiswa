// lib/features/applications/presentation/providers/my_applications_provider.dart

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/applications/domain/timeline_event.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'my_applications_provider.g.dart';

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