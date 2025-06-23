// lib/core/database/repositories/application_repository.dart
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Important imports for our data structures
import 'package:saku_beasiswa/core/models/full_scholarship_template_with_milestones.dart';
import 'package:saku_beasiswa/features/templates/presentation/providers/customise_wizard_provider.dart';
import 'package:saku_beasiswa/core/database/repositories/scholarship_template_repository.dart';
import 'package:saku_beasiswa/features/dashboard/presentation/providers/dashboard_providers.dart';


part 'application_repository.g.dart';

// A new data class to hold the rich application data for the UI
class FullUserApplication {
  final UserApplication application;
  final ScholarshipTemplate template;
  final Map<UserMilestone, List<UserTask>> milestonesWithTasks;

  FullUserApplication({
    required this.application,
    required this.template,
    required this.milestonesWithTasks,
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
    final fullTemplate = await _templateRepo.getFullTemplateWithMilestones(templateId);
    
    // For a "quick add", we must define a default main deadline.
    // Let's use the end date of the first milestone + 30 days as a rough guess, or today + 90 days.
    final firstMilestone = fullTemplate.milestonesWithTasks.keys.first;
    final defaultDeadline = DateTime.now().add(Duration(days: (firstMilestone.endDateOffsetDays * -1) + 30));
    
    // Now we can call our main creation logic
    return _createApplicationFromData(fullTemplate, defaultDeadline, {});
  }
  
  /// Creates a new, customized application from the wizard state.
  Future<UserApplication> createCustomApplication(CustomiseWizardState wizardState) async {
    // This method now just calls the private helper with all the rich data from the wizard.
    return _createApplicationFromData(
      wizardState.fullTemplate,
      wizardState.mainDeadline!,
      wizardState.milestoneDeadlineOverrides,
      customName: wizardState.customName,
      customColor: wizardState.customColor,
      includedTasks: wizardState.customizedTasks,
    );
  }

  /// Private helper to handle the core logic of creating an application.
  Future<UserApplication> _createApplicationFromData(
    FullScholarshipTemplateWithMilestones fullTemplate,
    DateTime mainDeadline,
    Map<int, DateTime> milestoneOverrides,
    {String? customName, String? customColor, List<TemplateTask>? includedTasks}
  ) async {
    return _db.transaction(() async {
      // 1. Create the UserApplication
      final newAppId = await _db.into(_db.userApplications).insert(
        UserApplicationsCompanion.insert(
          templateId: fullTemplate.template.id,
          customName: customName ?? fullTemplate.template.name,
          customColor: Value(customColor ?? fullTemplate.template.color),
        ),
      );

      // 2. Iterate through TEMPLATE milestones to create USER milestones
      for (final templateMilestone in fullTemplate.milestonesWithTasks.keys) {
        // Calculate the concrete end date for this user milestone
        final userMilestoneEndDate = milestoneOverrides[templateMilestone.id] ??
            mainDeadline.add(Duration(days: templateMilestone.endDateOffsetDays));
        
        final userMilestoneStartDate = milestoneOverrides[templateMilestone.id] ??
            mainDeadline.add(Duration(days: templateMilestone.startDateOffsetDays));

        // Create the UserMilestone
        final newUserMilestoneId = await _db.into(_db.userMilestones).insert(
          UserMilestonesCompanion.insert(
            userApplicationId: newAppId,
            name: templateMilestone.name,
            startDate: userMilestoneStartDate,
            endDate: userMilestoneEndDate,
          ),
        );
        
        // 3. Create USER tasks for this new user milestone
        final templateTasksForThisMilestone = fullTemplate.milestonesWithTasks[templateMilestone]!;
        
        final tasksToInsert = templateTasksForThisMilestone
          .where((templateTask) => includedTasks?.any((t) => t.id == templateTask.id) ?? true) // Filter based on wizard choices
          .map((templateTask) {
            // Calculate the concrete due date for this user task
            final userTaskDueDate = userMilestoneEndDate.add(Duration(days: templateTask.offsetDaysFromMilestoneEnd));
            return UserTasksCompanion.insert(
              userMilestoneId: newUserMilestoneId,
              label: templateTask.label,
              dueDate: userTaskDueDate,
            );
        }).toList();

        if (tasksToInsert.isNotEmpty) {
          await _db.batch((batch) => batch.insertAll(_db.userTasks, tasksToInsert));
        }
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
        return FullUserApplication(application: app, template: template, milestonesWithTasks: {}); // Return empty map for list view
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
    
    return FullUserApplication(
      application: application,
      template: template,
      milestonesWithTasks: milestonesWithTasks,
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

}