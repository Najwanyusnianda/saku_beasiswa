// lib/core/database/repositories/application_repository.dart
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saku_beasiswa/core/enums/document_status.dart';

// Important imports for our data structures
import 'package:saku_beasiswa/core/models/full_template_plan.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/features/dashboard/presentation/providers/dashboard_providers.dart';


part 'application_repository.g.dart';

// A new data class to hold the rich application data for the UI
class FullUserApplication {
  final UserApplication application;
  final ScholarshipTemplate template;
  final Map<UserMilestone, List<UserTask>> milestonesWithTasks;
  final List<UserDocument> documents;

  FullUserApplication({
    required this.application,
    required this.template,
    required this.milestonesWithTasks,
    required this.documents,
  });
}

@Riverpod(keepAlive: true)
ApplicationRepository applicationRepository(Ref ref) {
  return ApplicationRepository(ref.watch(appDatabaseProvider), ref.watch(scholarshipTemplateRepositoryProvider));
}

class ApplicationRepository {
  final AppDatabase _db;
  final ScholarshipTemplateRepository _templateRepo;

  ApplicationRepository(this._db, this._templateRepo);

  // --- REFACTORED: Application Creation Logic ---

  /// Creates a new application from a template with a default deadline.
  Future<UserApplication> createApplicationFromTemplate(String templateId) async {
    final fullPlan = await _templateRepo.getFullTemplatePlanById(templateId);
    
    // For a "quick add", use today + 90 days as the default deadline
    if (fullPlan.assembledMilestones.isEmpty) {
      throw Exception('No milestones found in template');
    }
    final defaultDeadline = DateTime.now().add(const Duration(days: 90));
    
    // Now we can call our main creation logic
    return _createApplicationFromData(fullPlan, defaultDeadline, {});
  }
  
  /// Creates a new, customized application from the wizard state.
  Future<UserApplication> createCustomApplication(CustomiseWizardState wizardState) async {
    // 1. Create a FullTemplatePlan object from the USER'S customized data within the wizard state.
    // This is the correct place for this logic.
    final userPlan = FullTemplatePlan(
      scholarshipTemplate: wizardState.fullTemplatePlan.scholarshipTemplate,
      documents: wizardState.userCustomizedDocuments,
      assembledMilestones: wizardState.userAssembledMilestones,
    );

    // 2. Call the private helper, passing the user's plan and the other necessary data.
    return _createApplicationFromData(
      userPlan, // Pass the newly constructed user plan
      wizardState.mainDeadline,
      wizardState.milestoneDeadlineOverrides,
      customName: wizardState.customName,
      // We need to pass the correct list of tasks here as well.
      includedTasks: wizardState.userCustomizedTasks,
    );
  }

  /// Private helper to handle the core logic of creating an application.
Future<UserApplication> _createApplicationFromData(
  FullTemplatePlan fullPlan, // Use the new data class
  DateTime mainDeadline,
  Map<int, DateTime> milestoneOverrides,
  {String? customName, String? customColor, List<TaskTemplate>? includedTasks}
) async {
  return _db.transaction(() async {
    // 1. Create the UserApplication (this part is the same)
    final newAppId = await _db.into(_db.userApplications).insert(
      UserApplicationsCompanion.insert(
        templateId: fullPlan.scholarshipTemplate.id,
        customName: customName ?? fullPlan.scholarshipTemplate.name,
        customColor: Value(customColor ?? fullPlan.scholarshipTemplate.color),
      ),
    );

    // 2. Iterate through ASSEMBLED milestones to create USER milestones
    for (final assembledMilestone in fullPlan.assembledMilestones) {
      final templateMilestone = assembledMilestone.milestoneTemplate;
      final link = assembledMilestone.link;

      // Calculate the concrete end date
      final userMilestoneEndDate = milestoneOverrides[templateMilestone.id] ??
          mainDeadline.add(Duration(days: link.endDateOffsetDays));
      
      final userMilestoneStartDate = milestoneOverrides[templateMilestone.id] ?? // Use same override logic for start date
          mainDeadline.add(Duration(days: link.startDateOffsetDays));

      // Create the UserMilestone
      final newUserMilestoneId = await _db.into(_db.userMilestones).insert(
        UserMilestonesCompanion.insert(
          userApplicationId: newAppId,
          name: templateMilestone.name, // Use name from the milestone template
          startDate: userMilestoneStartDate,
          endDate: userMilestoneEndDate,
        ),
      );
      
      // 3. Create USER tasks for this new user milestone from TASK TEMPLATES
      final tasksToInsert = assembledMilestone.taskTemplates
        .where((taskTemplate) => includedTasks?.any((t) => t.id == taskTemplate.id) ?? true)
        .map((taskTemplate) {
          final userTaskDueDate = userMilestoneEndDate.add(Duration(days: taskTemplate.defaultOffsetDays));
          return UserTasksCompanion.insert(
            userMilestoneId: newUserMilestoneId,
            label: taskTemplate.label,
            dueDate: userTaskDueDate,
          );
      }).toList();

      if (tasksToInsert.isNotEmpty) {
        await _db.batch((batch) => batch.insertAll(_db.userTasks, tasksToInsert));
      }
    }

    // 4. Create USER documents from TEMPLATE documents (this logic is still valid)
    if (fullPlan.documents.isNotEmpty) {
      final documentsToInsert = fullPlan.documents.map((templateDoc) => 
        UserDocumentsCompanion.insert(
          userApplicationId: newAppId,
          name: templateDoc.name
        )
      ).toList();
      await _db.batch((batch) => batch.insertAll(_db.userDocuments, documentsToInsert));
    }
    
    return (await (_db.select(_db.userApplications)..where((a) => a.id.equals(newAppId))).getSingle());
  });
}
  
  // --- REFACTORED: Watch Methods ---

  /// Watches all user applications, joining them with their template details.
  Stream<List<FullUserApplication>> watchAllFullApplications() {
    // This method needs to be more complex to rebuild the FullUserApplication object
    // For now, let's provide a simpler version. The full version is complex.
    final query = _db.select(_db.userApplications).join([
      innerJoin(_db.scholarshipTemplates, _db.scholarshipTemplates.id.equalsExp(_db.userApplications.templateId)),
    ]);
    
    // Note: This is a simplified watch. A full implementation would need to
    // fetch milestones and tasks for each application, which is heavy.
    // We'll build the detailed view separately.
    return query.watch().map((rows) {
      return rows.map((row) {
        final app = row.readTable(_db.userApplications);
        final template = row.readTable(_db.scholarshipTemplates);
        return FullUserApplication(application: app, template: template, milestonesWithTasks: {}, documents: []); // Return empty map for list view
      }).toList();
    });
  }

  /// Watches all tasks due within the next 7 days that are not yet completed.
  Stream<List<UserTask>> watchTodaysFocusTasks() {
    final sevenDaysFromNow = DateTime.now().add(const Duration(days: 7));
    final query = _db.select(_db.userTasks)
      ..where((t) => t.isCompleted.equals(false) & t.dueDate.isSmallerOrEqualValue(sevenDaysFromNow))
      ..orderBy([(t) => OrderingTerm(expression: t.dueDate, mode: OrderingMode.asc)])
      ..limit(5); // Limit to 5 for the dashboard
    return query.watch();
  }
  
  Future<void> updateTaskStatus(int taskId, bool isCompleted) async {
    await (_db.update(_db.userTasks)..where((t) => t.id.equals(taskId)))
        .write(UserTasksCompanion(isCompleted: Value(isCompleted)));
  }

  Future<void> deleteApplication(int applicationId) async {
    await _db.transaction(() async {
      final milestones = await (_db.select(_db.userMilestones)
            ..where((m) => m.userApplicationId.equals(applicationId)))
          .get();
      final milestoneIds = milestones.map((m) => m.id).toList();

      if (milestoneIds.isNotEmpty) {
        await (_db.delete(_db.userTasks)..where((t) => t.userMilestoneId.isIn(milestoneIds))).go();
      }
      
      await (_db.delete(_db.userMilestones)..where((m) => m.userApplicationId.equals(applicationId))).go();
      await (_db.delete(_db.userApplications)..where((a) => a.id.equals(applicationId))).go();
    });
  }

  Future<FullUserApplication> getFullApplicationById(int userApplicationId) async {
  // 1. Fetch the main UserApplication and its ScholarshipTemplate
  final appQuery = _db.select(_db.userApplications).join([
    innerJoin(_db.scholarshipTemplates, _db.scholarshipTemplates.id.equalsExp(_db.userApplications.templateId)),
  ])..where(_db.userApplications.id.equals(userApplicationId));
  
  final row = await appQuery.getSingle();
  final application = row.readTable(_db.userApplications);
  final template = row.readTable(_db.scholarshipTemplates);

  // 2. Fetch all UserMilestones for this application
  final milestones = await (_db.select(_db.userMilestones)
    ..where((m) => m.userApplicationId.equals(userApplicationId))
    ..orderBy([(m) => OrderingTerm(expression: m.endDate)]))
    .get();
  
  // 3. For each UserMilestone, fetch its UserTasks
    final milestonesWithTasks = <UserMilestone, List<UserTask>>{};
    for (final milestone in milestones) {
      final tasks = await (_db.select(_db.userTasks)
        ..where((t) => t.userMilestoneId.equals(milestone.id)))
        .get();
      milestonesWithTasks[milestone] = tasks;
    }
      // NEW: Fetch all UserDocuments for this application
  final documents = await (_db.select(_db.userDocuments)
    ..where((d) => d.userApplicationId.equals(userApplicationId)))
    .get();

  return FullUserApplication(
    application: application,
    template: template,
    milestonesWithTasks: milestonesWithTasks,
    documents: documents, // <-- PASS THE DOCUMENTS HERE
  );

  }

  Stream<FullUserApplication> watchFullApplicationById(int userApplicationId) {
  // We need to watch all related tables and combine them into one stream.
  // This is complex, so we'll use Stream.combineLatest from the 'async' package.
  // Add `async: ^2.11.0` to your pubspec.yaml if you don't have it.
  
  // 1. Watch the main application and its template
  final appQuery = _db.select(_db.userApplications).join([
    innerJoin(_db.scholarshipTemplates, _db.scholarshipTemplates.id.equalsExp(_db.userApplications.templateId)),
  ])..where(_db.userApplications.id.equals(userApplicationId));
  
  final appStream = appQuery.watchSingle().map((row) => FullUserApplication(
    application: row.readTable(_db.userApplications),
    template: row.readTable(_db.scholarshipTemplates),
    milestonesWithTasks: {}, // We'll populate this later
    documents: []
  ));

  // 2. Watch all milestones for the application
  final milestonesStream = (_db.select(_db.userMilestones)
    ..where((m) => m.userApplicationId.equals(userApplicationId))
    ..orderBy([(m) => OrderingTerm(expression: m.endDate)]))
    .watch();

  // 3. Watch all documents for the application
  final documentsStream = (_db.select(_db.userDocuments)
    ..where((d) => d.userApplicationId.equals(userApplicationId)))
    .watch();

  // 4. Watch ALL tasks for the application
  final tasksStream = watchTasksForApplication(userApplicationId);
  
  // Combine all streams into one. When ANY of them change, this whole block re-runs.
  return Rx.combineLatest4(
    appStream,
    milestonesStream,
    documentsStream,
    tasksStream,
    (FullUserApplication appData, List<UserMilestone> milestones, List<UserDocument> documents, List<UserTask> tasks) {
      
      // Now, we correctly associate tasks with their milestones
      final milestonesWithTasks = <UserMilestone, List<UserTask>>{};
      for (final milestone in milestones) {
        milestonesWithTasks[milestone] = tasks.where((task) => task.userMilestoneId == milestone.id).toList();
      }

      // Return the final, fully populated object
      return FullUserApplication(
        application: appData.application,
        template: appData.template,
        documents: documents,
        milestonesWithTasks: milestonesWithTasks,
      );
    },
  );
}

  // Add this new method as well, for the completion percentage provider
  Stream<List<UserTask>> watchTasksForApplication(int userApplicationId) {
    final milestoneIdsQuery = _db.selectOnly(_db.userMilestones)
      ..addColumns([_db.userMilestones.id])
      ..where(_db.userMilestones.userApplicationId.equals(userApplicationId));

    return (_db.select(_db.userTasks)
      ..where((t) => t.userMilestoneId.isInQuery(milestoneIdsQuery)))
      .watch();
  }

  Future<UserTask?> getNextUpcomingTaskForApplication(int userApplicationId) async {
  // First, get all milestone IDs for the given application
  final milestoneIdsQuery = _db.selectOnly(_db.userMilestones)
    ..addColumns([_db.userMilestones.id])
    ..where(_db.userMilestones.userApplicationId.equals(userApplicationId));

  // Then, find the first task within those milestones that meets the criteria
  final query = _db.select(_db.userTasks)
    ..where((t) => t.userMilestoneId.isInQuery(milestoneIdsQuery)) // Task belongs to this app
    ..where((t) => t.isCompleted.equals(false))                     // Is not completed
    ..orderBy([(t) => OrderingTerm(expression: t.dueDate)])         // Order by the nearest due date
    ..limit(1);                                                     // Get only the very next one

  return query.getSingleOrNull();
}

//Dashboard

// Method for activeApplicationsCountProvider
Stream<int> watchActiveApplicationsCount() {
  final query = _db.select(_db.userApplications)
    ..where((a) => a.status.equals('in_progress'));
  return query.watch().map((apps) => apps.length);
}

// Method for overdueTasksCountProvider
Stream<int> watchOverdueTasksCount() {
  final now = DateTime.now();
  final query = _db.select(_db.userTasks)
    ..where((t) => t.isCompleted.equals(false) & t.dueDate.isSmallerThanValue(now));
  return query.watch().map((tasks) => tasks.length);
}

// Method for nextMilestoneDeadlineProvider
Stream<UserMilestone?> watchNextMilestoneDeadline() {
  final now = DateTime.now();
  final query = _db.select(_db.userMilestones)
    ..where((m) => m.endDate.isBiggerOrEqualValue(now)) // Only future milestones
    ..orderBy([(m) => OrderingTerm(expression: m.endDate)])
    ..limit(1);
  return query.watchSingleOrNull();
}

// Method for todaysFocusProvider
Future<List<FocusTask>> getTodaysFocusTasks() async {
  final sevenDaysFromNow = DateTime.now().add(const Duration(days: 7));
  
  // 1. Get top 5 urgent tasks
  final urgentTasksQuery = _db.select(_db.userTasks)
    ..where((t) => t.isCompleted.equals(false) & t.dueDate.isSmallerOrEqualValue(sevenDaysFromNow))
    ..orderBy([(t) => OrderingTerm(expression: t.dueDate)])
    ..limit(5);

  final urgentTasks = await urgentTasksQuery.get();
  if (urgentTasks.isEmpty) return [];

  // 2. Efficiently fetch their parent milestones, applications, and templates
  final milestoneIds = urgentTasks.map((t) => t.userMilestoneId).toSet();
  final milestones = await (_db.select(_db.userMilestones)..where((m) => m.id.isIn(milestoneIds))).get();
  
  final applicationIds = milestones.map((m) => m.userApplicationId).toSet();
  final appQuery = _db.select(_db.userApplications).join([
    innerJoin(_db.scholarshipTemplates, _db.scholarshipTemplates.id.equalsExp(_db.userApplications.templateId)),
  ])..where(_db.userApplications.id.isIn(applicationIds));
  
  final appRows = await appQuery.get();
  
  // 3. Map the data into FocusTask objects
  final result = <FocusTask>[];
  for (final task in urgentTasks) {
    final milestone = milestones.firstWhere((m) => m.id == task.userMilestoneId);
    final appRow = appRows.firstWhere((row) => row.readTable(_db.userApplications).id == milestone.userApplicationId);
    
    result.add(FocusTask(
      task: task,
      application: appRow.readTable(_db.userApplications),
      template: appRow.readTable(_db.scholarshipTemplates),
    ));
  }
  
  return result;
}


// --- Milestone Management ---
Future<UserMilestone> addUserMilestone(UserMilestonesCompanion milestone) async {
  return _db.into(_db.userMilestones).insertReturning(milestone);
}

Future<void> updateUserMilestone(UserMilestone milestone) async {
  await _db.update(_db.userMilestones).replace(milestone);
}

Future<void> deleteUserMilestone(int milestoneId) async {
  // Must also delete child tasks
  await _db.transaction(() async {
    await (_db.delete(_db.userTasks)..where((t) => t.userMilestoneId.equals(milestoneId))).go();
    await (_db.delete(_db.userMilestones)..where((m) => m.id.equals(milestoneId))).go();
  });
}

// --- Task Management ---
Future<UserTask> addUserTask(UserTasksCompanion task) async {
  return _db.into(_db.userTasks).insertReturning(task);
}

Future<void> updateUserTask(UserTask task) async {
  await _db.update(_db.userTasks).replace(task);
}

Future<void> deleteUserTask(int taskId) async {
  await (_db.delete(_db.userTasks)..where((t) => t.id.equals(taskId))).go();
}



// --- Document Management ---

Future<UserDocument> addUserDocument(UserDocumentsCompanion document) async {
  return await _db.into(_db.userDocuments).insertReturning(document);
}

Future<void> updateUserDocument(UserDocument document) async {
  await _db.update(_db.userDocuments).replace(document);
}

Future<void> deleteUserDocument(int documentId) async {
  await (_db.delete(_db.userDocuments)..where((d) => d.id.equals(documentId))).go();
}

// This method is for the SegmentedButton in the UI
Future<void> updateUserDocumentStatus(int documentId, DocumentStatus status) async {
  await (_db.update(_db.userDocuments)..where((d) => d.id.equals(documentId)))
      .write(UserDocumentsCompanion(status: Value(status)));
}

}