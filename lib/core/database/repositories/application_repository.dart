// lib/core/database/repositories/application_repository.dart

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/services/notification_service.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:drift/drift.dart';

part 'application_repository.g.dart';

class ApplicationWithTemplate {
  final Application application;
  final ScholarshipTemplate template;
  ApplicationWithTemplate({required this.application, required this.template});
}

// Define the provider for the repository in this file
@riverpod
ApplicationRepository applicationRepository(Ref ref) {
  return ApplicationRepository(ref.watch(appDatabaseProvider), ref);
}


class ApplicationRepository {
  final AppDatabase _db;
  final Ref ref;
  ApplicationRepository(this._db, this.ref);

  // --- UPDATED METHOD ---
  // Creates an application and its associated tasks from a template.
  Future<Application> createApplicationFromTemplate(String templateId) async {
    final mainDeadline = DateTime.now().add(const Duration(days: 90));

    final newApplicationCompanion = ApplicationsCompanion.insert(
      templateId: templateId,
      deadline: mainDeadline,
      status: Value('in_progress'),
    );
    
    // Create the application and return the resulting object
    final newApplication = await _db.into(_db.applications).insertReturning(newApplicationCompanion);

    // Fetch and insert tasks (logic is unchanged)
    final templateTasks = await (_db.select(_db.templateTasks)..where((tbl) => tbl.templateId.equals(templateId))).get();
    if (templateTasks.isNotEmpty) {
      final List<TasksCompanion> tasksToInsert = [];
      for (final templateTask in templateTasks) {
        DateTime? taskDueDate;
        if (templateTask.offsetDays != null) {
          taskDueDate = mainDeadline.add(Duration(days: templateTask.offsetDays!));
        }
        tasksToInsert.add(
          TasksCompanion.insert(
            applicationId: newApplication.id,
            title: templateTask.label,
            category: Value(templateTask.stage ?? 'Other'),
            dueDate: Value(taskDueDate),
          ),
        );
      }
      await _db.batch((batch) => batch.insertAll(_db.tasks, tasksToInsert));
    }

    return newApplication;
  }

    // --- NEW METHOD ---
  // Deletes an application and all its associated tasks.
  Future<void> deleteApplication(int applicationId) async {
    // It's good practice to wrap multi-table deletes in a transaction
    return _db.transaction(() async {
      // Delete all tasks associated with the application
      await (_db.delete(_db.tasks)..where((tbl) => tbl.applicationId.equals(applicationId))).go();
      // Delete the main application entry
      await (_db.delete(_db.applications)..where((tbl) => tbl.id.equals(applicationId))).go();
    });
  }


  // Updates the notes for a specific application
  Future<void> updateNotes(int applicationId, String notes) async {
    await (_db.update(_db.applications)..where((tbl) => tbl.id.equals(applicationId)))
        .write(ApplicationsCompanion(
          id: Value(applicationId),
          notes: Value(notes),
        ));
  }

  // Method to count active applications (in_progress)
  Stream<int> watchActiveApplicationsCount() {
    final query = _db.select(_db.applications)
      ..where((tbl) => tbl.status.equals('in_progress'));
    
    // Watch the query and map the result list to its length.
    return query.watch().map((listOfApps) => listOfApps.length);
  }

  // Method to find the next upcoming deadline for an active application
  Stream<Application?> watchNextDeadline() {
    final query = _db.select(_db.applications)
      ..where((tbl) => tbl.status.equals('in_progress'))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.deadline, mode: OrderingMode.asc)])
      ..limit(1);
      
    // watch a query that returns a single result
    return query.watchSingleOrNull();
  }

    // New method to add a single task to an application
  Future<void> addTask(TasksCompanion task) async {
    await _db.into(_db.tasks).insert(task);
  }

  // Method to get today's focus tasks (due in the next 7 days, and not completed)
  Stream<List<Task>> watchTodaysFocusTasks() {
    final sevenDaysFromNow = DateTime.now().add(const Duration(days: 7));

    final query = _db.select(_db.tasks)
      ..where((tbl) => tbl.status.equals('pending') & tbl.dueDate.isSmallerOrEqualValue(sevenDaysFromNow))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.dueDate, mode: OrderingMode.asc)])
      ..limit(3); // Show top 3 priority tasks

    return query.watch();
  }
  
  // Watches all tasks for a specific application ID.
  Stream<List<Task>> watchTasksForApplication(int applicationId) {
    return (_db.select(_db.tasks)..where((tbl) => tbl.applicationId.equals(applicationId))).watch();
  }

  // Updates the status of a specific task.
  Future<void> updateTaskStatus(int taskId, bool isCompleted) async {
    final status = isCompleted ? 'completed' : 'pending';
    await (_db.update(_db.tasks)..where((tbl) => tbl.id.equals(taskId)))
        .write(TasksCompanion(status: Value(status)));
  }

  // Watches all applications and joins them with their template details.
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

  // Watches a single application by its ID and joins it with template details.
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

    // --- NEW METHOD FOR THE WIZARD ---
  Future<void> createCustomApplication(CustomiseWizardState wizardState) async {
    // 1. Create the Application using data from the wizard state
    final newApplication = await _db.into(_db.applications).insertReturning(
      ApplicationsCompanion.insert(
        templateId: wizardState.fullTemplate.template.id,
        deadline: wizardState.mainDeadline!, // Assumes deadline is set
        status: const Value('in_progress'),
        customName: Value(wizardState.customName),
        customColor: Value(wizardState.customColor),
      ),
    );

    // 2. Get the list of tasks the user selected in the wizard
    final tasksToCreate = wizardState.customizedTasks;
    if (tasksToCreate.isEmpty) return;

    // 3. Create real Tasks from the customized list
    final List<TasksCompanion> tasksToInsert = [];
    for (final customTask in tasksToCreate) {
      DateTime? taskDueDate;
      if (customTask.offsetDays != null) {
        taskDueDate = wizardState.mainDeadline!.add(Duration(days: customTask.offsetDays!));
      }
      tasksToInsert.add(
        TasksCompanion.insert(
          applicationId: newApplication.id,
          title: customTask.label,
          category: Value(customTask.stage ?? 'Other'),
          dueDate: Value(taskDueDate),
        ),
      );
    }
    
    // 4. Batch insert all the new tasks
    await _db.batch((batch) {
      batch.insertAll(_db.tasks, tasksToInsert);
    });
}
}
