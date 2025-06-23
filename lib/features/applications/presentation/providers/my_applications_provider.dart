// lib/features/applications/presentation/providers/my_applications_provider.dart
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:collection/collection.dart'; // Import for groupBy
import 'package:saku_beasiswa/features/applications/domain/application_status.dart';
part 'my_applications_provider.g.dart';




// --- WATCHERS for the APPLICATION LIST ---

// This provider now watches the new method in the repository.
// It returns a list of FullUserApplication which contains the UserApplication and its Template.
@riverpod
Stream<List<FullUserApplication>> myApplications(Ref ref) {
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.watchAllFullApplications();
}

@riverpod
Stream<List<UserTask>> watchTasksForApplication(
  Ref ref,
  int userApplicationId,
) {
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.watchTasksForApplication(userApplicationId);
}

@riverpod
Future<UserTask?> nextUpcomingTask(Ref ref, int userApplicationId) {
  final repo = ref.watch(applicationRepositoryProvider);
  // We need a new method in the repository for this.
  return repo.getNextUpcomingTaskForApplication(userApplicationId);
}

@riverpod
Future<ApplicationStatus> applicationStatus(Ref ref, int userApplicationId) async {
  // We need to fetch the application's tasks and milestones to determine its status.
  // We can leverage the providers we've already built!
  final tasks = await ref.watch(watchTasksForApplicationProvider(userApplicationId).future);
  final fullApp = await ref.watch(applicationDetailProvider(userApplicationId).future);
  
  final now = DateTime.now();

  // 1. Check for OVERDUE tasks first (highest priority)
  final hasOverdueTask = tasks.any((task) => !task.isCompleted && task.dueDate.isBefore(now));
  if (hasOverdueTask) {
    return ApplicationStatus.overdue;
  }

  // 2. If not overdue, check for milestones that are AT RISK
  // Find the next upcoming milestone that is not yet fully completed.
  UserMilestone? nextMilestone;
  for (final milestone in fullApp.milestonesWithTasks.keys) {
    // A milestone is completed if all its tasks are completed.
    final milestoneTasks = fullApp.milestonesWithTasks[milestone]!;
    final isMilestoneCompleted = milestoneTasks.every((t) => t.isCompleted);

    // If this milestone is not completed and its end date is in the future, it's a candidate.
    if (!isMilestoneCompleted && milestone.endDate.isAfter(now)) {
      nextMilestone = milestone;
      break; // We found the first upcoming milestone, so we can stop looking.
    }
  }

  if (nextMilestone != null) {
    final daysUntilMilestoneEnds = nextMilestone.endDate.difference(now).inDays;
    // If the next milestone is ending in 14 days or less, it's at risk.
    if (daysUntilMilestoneEnds <= 14) {
      return ApplicationStatus.atRisk;
    }
  }

  // 3. If everything is fine, the status is ON TRACK
  return ApplicationStatus.onTrack;
}

// This provider calculates the completion percentage based on USER TASKS.
@riverpod
Stream<double> applicationCompletionPercentage(Ref ref, int userApplicationId) {
  // We need a new method in the repo to get all tasks for an application
  final tasksStream = ref.watch(watchTasksForApplicationProvider(userApplicationId).stream);

  return tasksStream.map((tasks) {
    if (tasks.isEmpty) return 0.0;
    final completedCount = tasks.where((task) => task.isCompleted).length;
    return completedCount / tasks.length;
  });
}

// --- WATCHERS for the APPLICATION DETAIL SCREEN ---

// This provider will fetch the entire application detail: app, template, milestones, and tasks.
@riverpod
Future<FullUserApplication> applicationDetail(Ref ref, int userApplicationId) {
  // This requires a new method in the repository. Let's assume we'll add it.
  final repo = ref.watch(applicationRepositoryProvider);
  return repo.getFullApplicationById(userApplicationId);
}

// This is a new helper provider that just extracts the milestones and tasks from the main detail provider.
@riverpod
Stream<Map<UserMilestone, List<UserTask>>> applicationMilestonesWithTasks(
  Ref ref,
  int userApplicationId,
) async* {
  // This watches the main detail provider. When it re-fetches, this will automatically update.
  final detail = await ref.watch(applicationDetailProvider(userApplicationId).future);
  yield detail.milestonesWithTasks;
}