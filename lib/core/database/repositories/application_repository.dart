import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/services/notification_service.dart';

class ApplicationWithTemplate {
  final Application application;
  final ScholarshipTemplate template;
  ApplicationWithTemplate({required this.application, required this.template});
}

class ApplicationRepository {
  final AppDatabase _db;
  final Ref ref;
  ApplicationRepository(this._db, this.ref);

  Future<void> createApplicationFromTemplate(String templateId) async {
    final template = await (_db.select(_db.scholarshipTemplates)..where((tbl) => tbl.id.equals(templateId))).getSingle();
    final newApplicationCompanion = ApplicationsCompanion(
      templateId: Value(templateId),
      deadline: Value(DateTime.now().add(const Duration(days: 90))),
      status: const Value('in_progress'),
    );
    final newApplication = await _db.into(_db.applications).insertReturning(newApplicationCompanion);
    await ref.read(notificationServiceProvider).scheduleDeadlineReminders(newApplication);

    final List<TasksCompanion> tasksToInsert = [];
    if (template.defaultStages != null && template.defaultStages!.isNotEmpty) {
      final stages = jsonDecode(template.defaultStages!) as List;
      for (var stage in stages) {
        tasksToInsert.add(
          TasksCompanion.insert(
            applicationId: newApplication.id,
            title: stage['title'] ?? 'Untitled Task',
            category: Value(stage['category'] ?? 'Other'),
          ),
        );
      }
    }
    if (tasksToInsert.isNotEmpty) {
      await _db.batch((batch) {
        batch.insertAll(_db.tasks, tasksToInsert);
      });
    }
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
}
