// lib/core/database/repositories/application_repository.dart

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';

part 'application_repository.g.dart';

/// A data class holding an [Application] and its corresponding [ScholarshipTemplate].
class ApplicationWithTemplate {
  final Application application;
  final ScholarshipTemplate template;

  ApplicationWithTemplate({required this.application, required this.template});
}

/// Riverpod provider for the [ApplicationRepository].
@riverpod
ApplicationRepository applicationRepository(Ref ref) {
  return ApplicationRepository(ref.watch(appDatabaseProvider), ref);
}

/// Repository for handling all data operations related to applications and tasks.
class ApplicationRepository {
  final AppDatabase _db;
  final Ref ref;

  ApplicationRepository(this._db, this.ref);

  //
  // ----------------- APPLICATION OPERATIONS ----------------- //
  //

  /// Creates a new application from a predefined template, including its tasks.
  Future<Application> createApplicationFromTemplate(String templateId) async {
    final mainDeadline = DateTime.now().add(const Duration(days: 90));

    final newApplicationCompanion = ApplicationsCompanion.insert(
      templateId: templateId,
      deadline: mainDeadline,
      status: const Value('in_progress'),
    );

    final newApplication = await _db.into(_db.applications).insertReturning(newApplicationCompanion);

    // Fetch tasks from the template and create them for the new application.
    final templateTasks = await (_db.select(_db.templateTasks)..where((tbl) => tbl.templateId.equals(templateId))).get();
    if (templateTasks.isNotEmpty) {
      final tasksToInsert = templateTasks.map((templateTask) {
        final taskDueDate = templateTask.offsetDays != null
            ? mainDeadline.add(Duration(days: templateTask.offsetDays!))
            : null;
        return TasksCompanion.insert(
          applicationId: newApplication.id,
          title: templateTask.label,
          category: Value(templateTask.stage ?? 'Other'),
          dueDate: Value(taskDueDate),
        );
      }).toList();
      await _db.batch((batch) => batch.insertAll(_db.tasks, tasksToInsert));
    }

    return newApplication;
  }

  /// Creates a new, customized application based on the user's choices in the setup wizard.
  Future<void> createCustomApplication(CustomiseWizardState wizardState) async {
    final newApplication = await _db.into(_db.applications).insertReturning(
      ApplicationsCompanion.insert(
        templateId: wizardState.fullTemplate.template.id,
        deadline: wizardState.mainDeadline!,
        status: const Value('in_progress'),
        customName: Value(wizardState.customName),
        customColor: Value(wizardState.customColor),
      ),
    );

    final tasksToCreate = wizardState.customizedTasks;
    if (tasksToCreate.isEmpty) return;

    final tasksToInsert = tasksToCreate.map((customTask) {
      final taskDueDate = customTask.offsetDays != null
          ? wizardState.mainDeadline!.add(Duration(days: customTask.offsetDays!))
          : null;
      return TasksCompanion.insert(
        applicationId: newApplication.id,
        title: customTask.label,
        category: Value(customTask.stage ?? 'Other'),
        dueDate: Value(taskDueDate),
      );
    }).toList();

    await _db.batch((batch) {
      batch.insertAll(_db.tasks, tasksToInsert);
    });
  }

  /// Watches all applications, joining them with their template details.
  Stream<List<ApplicationWithTemplate>> watchAllApplications() {
    final query = _db.select(_db.applications).join([
      innerJoin(
        _db.scholarshipTemplates,
        _db.scholarshipTemplates.id.equalsExp(_db.applications.templateId),
      ),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return ApplicationWithTemplate(
          application: row.readTable(_db.applications),
          template: row.readTable(_db.scholarshipTemplates),
        );
      }).toList();
    });
  }

  /// Watches a single application by its ID, joining it with template details.
  Stream<ApplicationWithTemplate> watchApplicationById(int id) {
    final query = _db.select(_db.applications).join([
      innerJoin(
        _db.scholarshipTemplates,
        _db.scholarshipTemplates.id.equalsExp(_db.applications.templateId),
      ),
    ])
      ..where(_db.applications.id.equals(id));

    return query.watchSingle().map((row) {
      return ApplicationWithTemplate(
        application: row.readTable(_db.applications),
        template: row.readTable(_db.scholarshipTemplates),
      );
    });
  }

  /// Watches the count of all applications currently 'in_progress'.
  Stream<int> watchActiveApplicationsCount() {
    final query = _db.select(_db.applications)..where((tbl) => tbl.status.equals('in_progress'));
    return query.watch().map((listOfApps) => listOfApps.length);
  }

  /// Watches the next upcoming deadline among all active applications.
  Stream<Application?> watchNextDeadline() {
    final query = _db.select(_db.applications)
      ..where((tbl) => tbl.status.equals('in_progress'))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.deadline, mode: OrderingMode.asc)])
      ..limit(1);
    return query.watchSingleOrNull();
  }

  /// Updates the notes for a specific application.
  Future<void> updateNotes(int applicationId, String notes) async {
    await (_db.update(_db.applications)..where((tbl) => tbl.id.equals(applicationId)))
        .write(ApplicationsCompanion(notes: Value(notes)));
  }

  /// Deletes an application and all of its associated tasks.
  Future<void> deleteApplication(int applicationId) async {
    await _db.transaction(() async {
      await (_db.delete(_db.tasks)..where((tbl) => tbl.applicationId.equals(applicationId))).go();
      await (_db.delete(_db.applications)..where((tbl) => tbl.id.equals(applicationId))).go();
    });
  }

  //
  // -------------------- TASK OPERATIONS -------------------- //
  //

  /// Adds a single new task to an application.
  Future<void> addTask(TasksCompanion task) async {
    await _db.into(_db.tasks).insert(task);
  }

  /// Watches all tasks for a specific application ID.
  Stream<List<Task>> watchTasksForApplication(int applicationId) {
    return (_db.select(_db.tasks)..where((tbl) => tbl.applicationId.equals(applicationId))).watch();
  }

  /// Watches tasks due within the next 7 days that are not yet completed.
  Stream<List<Task>> watchTodaysFocusTasks() {
    final sevenDaysFromNow = DateTime.now().add(const Duration(days: 7));

    final query = _db.select(_db.tasks)
      ..where((tbl) => tbl.status.equals('pending') & tbl.dueDate.isSmallerOrEqualValue(sevenDaysFromNow))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.dueDate, mode: OrderingMode.asc)])
      ..limit(3);

    return query.watch();
  }

  /// Updates the status of a specific task ('completed' or 'pending').
  Future<void> updateTaskStatus(int taskId, bool isCompleted) async {
    final status = isCompleted ? 'completed' : 'pending';
    await (_db.update(_db.tasks)..where((tbl) => tbl.id.equals(taskId)))
        .write(TasksCompanion(status: Value(status)));
  }

  /// Updates a task's due date and optionally cascades the date shift to subsequent tasks.
  Future<void> updateTaskDueDate(int taskId, DateTime newDueDate, {bool cascade = false}) async {
    await _db.transaction(() async {
      final originalTask = await (_db.select(_db.tasks)..where((tbl) => tbl.id.equals(taskId))).getSingle();
      final oldDueDate = originalTask.dueDate;

      await (_db.update(_db.tasks)..where((tbl) => tbl.id.equals(taskId)))
          .write(TasksCompanion(dueDate: Value(newDueDate)));

      // If cascade is enabled and there's a date to shift from, calculate and apply it.
      if (cascade && oldDueDate != null) {
        final shift = newDueDate.difference(oldDueDate);
        await _cascadeShiftTaskDates(originalTask.applicationId, taskId, oldDueDate, shift);
      }
    });
  }

  /// Deletes a single task by its ID.
  Future<void> deleteTask(int taskId) async {
    await (_db.delete(_db.tasks)..where((tbl) => tbl.id.equals(taskId))).go();
  }

    // --- METHOD BARU ---
  // Mencari satu tugas berikutnya yang belum selesai dengan tanggal paling awal
  Future<Task?> getNextUpcomingTask(int applicationId) async {
    final query = _db.select(_db.tasks)
      ..where((tbl) =>
          tbl.applicationId.equals(applicationId) &
          tbl.status.equals('pending') &
          tbl.dueDate.isNotNull())
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.dueDate, mode: OrderingMode.asc)])
      ..limit(1);

    return query.getSingleOrNull();
  }

  // --- METHOD BARU ---
  // Mengambil semua task dari semua aplikasi
  Stream<List<Task>> watchAllTasks() {
    return _db.select(_db.tasks).watch();
  }

  //
  // ----------------- PRIVATE HELPER METHODS ----------------- //
  //

  /// Shifts the due dates of tasks that occur after a specified task's original due date.
  Future<void> _cascadeShiftTaskDates(
    int applicationId,
    int sourceTaskId,
    DateTime sourceOldDueDate,
    Duration shift,
  ) async {
    // Get all tasks in the same application, excluding the one that triggered the cascade.
    final allTasks = await (_db.select(_db.tasks)
          ..where((tbl) => tbl.applicationId.equals(applicationId) & tbl.id.isNotValue(sourceTaskId)))
        .get();

    // Filter for tasks that are due on or after the source task's original due date.
    final tasksToShift = allTasks.where((task) {
      if (task.dueDate == null) return false;
      return !task.dueDate!.isBefore(sourceOldDueDate);
    }).toList();

    if (tasksToShift.isEmpty) return;

    // Prepare batch update for all affected tasks.
    final updatedTasks = tasksToShift.map((task) {
      final newDueDate = task.dueDate!.add(shift);
      return TasksCompanion(id: Value(task.id), dueDate: Value(newDueDate));
    }).toList();

    // Execute the update in a single transaction.
    await _db.batch((batch) {
      for (final taskCompanion in updatedTasks) {
        batch.update(_db.tasks, taskCompanion, where: (row) => row.id.equals(taskCompanion.id.value));
      }
    });
  }
}
