import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app_database.g.dart';

// --- TABLE DEFINITIONS ---
// We start with the UserProfile table.
// Drift will generate a class called `UserProfile` from this.
@DataClassName('UserProfile')
class UserProfiles extends Table {
  // The user will always have ID 1 for simplicity in this single-user app.
  IntColumn get id => integer().withDefault(const Constant(1))();
  
  // S1, S2, S3
  TextColumn get studyLevel => text().nullable()();

  // e.g., "Computer Science"
  TextColumn get fieldOfStudy => text().nullable()();

  // We will store the list of countries as a single comma-separated string.
  // This is a simple approach. For more complex needs, a separate table could be used.
  TextColumn get targetCountries => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// --- NEW TABLE ---
@DataClassName('ScholarshipTemplate')
class ScholarshipTemplates extends Table {
  // Use a unique text ID like 'lpdp-2024'
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get providerName => text().named('provider_name')();
  TextColumn get logoUrl => text().nullable()();
  
  // Stored as a comma-separated string: "S1,S2"
  TextColumn get studyLevels => text()();
  
  // Stored as a comma-separated string: "Computer Science,Engineering"
  TextColumn get fieldsOfStudy => text().named('fields_of_study')();
  
  // Stored as a comma-separated string: "USA,UK,Global"
  TextColumn get targetCountries => text().named('target_countries')();

  @override
  Set<Column> get primaryKey => {id};
}

// --- NEW TABLES ---
@DataClassName('Application')
class Applications extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Links to the template this application was created from.
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();
  
  // "in_progress", "submitted", "accepted", "rejected"
  TextColumn get status => text().withDefault(const Constant('in_progress'))();
  DateTimeColumn get deadline => dateTime()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Task')
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Links to the application this task belongs to.
  IntColumn get applicationId => integer().references(Applications, #id)();

  TextColumn get title => text()();
  // "pending", "completed"
  TextColumn get status => text().withDefault(const Constant('pending'))();
  // Optional due date for a specific task
  DateTimeColumn get dueDate => dateTime().nullable()();
  // Category for grouping tasks
  TextColumn get category => text().withDefault(const Constant('Other'))();
}







// --- DATABASE CLASS ---
// This is the main database class. The annotation `@DriftDatabase` tells
// the generator what tables to include.
@DriftDatabase(
  tables: [
    UserProfiles, 
  ScholarshipTemplates,
  Applications,
  Tasks
  ])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3; // Increment this when you change tables

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seedTemplates(this);
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        // Migration logic from version 1 to 2
        await m.createTable(scholarshipTemplates);
        await _seedTemplates(this);
      }
      if (from < 3) {
        // Migration logic from version 2 to 3
        await m.createTable(applications);
        await m.createTable(tasks);
      }
    },
  );
}

// --- SEEDING FUNCTION ---
// This function adds our initial scholarship data.
Future<void> _seedTemplates(AppDatabase db) async {
  final templates = [
    // Add some sample data here. In a real app, this would come from a server.
    const ScholarshipTemplatesCompanion(
      id: Value('lpdp-2024'),
      name: Value('Beasiswa LPDP Reguler'),
      providerName: Value('Kemenkeu RI'),
      studyLevels: Value('S2,S3'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('Global'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('aas-2024'),
      name: Value('Australia Awards Scholarship'),
      providerName: Value('Australian Government'),
      studyLevels: Value('S2,S3'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('Australia'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('chevening-2024'),
      name: Value('Chevening Scholarship'),
      providerName: Value('UK Government'),
      studyLevels: Value('S2'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('UK'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('unggul-2024'),
      name: Value('Beasiswa Unggulan'),
      providerName: Value('Kemendikbudristek'),
      studyLevels: Value('S1,S2,S3'),
      fieldsOfStudy: Value('All'),
      targetCountries: Value('Indonesia'),
    ),
    const ScholarshipTemplatesCompanion(
      id: Value('comp-sci-usa-2024'),
      name: Value('Fulbright Scholarship (STEM)'),
      providerName: Value('AMINEF (USA Government)'),
      studyLevels: Value('S2,S3'),
      fieldsOfStudy: Value('Computer Science,Engineering'),
      targetCountries: Value('USA'),
    ),
  ];
  
  await db.batch((batch) {
    batch.insertAll(db.scholarshipTemplates, templates, mode: InsertMode.insertOrReplace);
  });
}

// This function opens the database connection.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'saku_beasiswa.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

// --- PROVIDERS ---
// A Riverpod provider to give the rest of the app access to the database instance.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

// A provider for our user profile repository.
// Repositories are the bridge between our UI/logic and the database.
@riverpod
UserProfileRepository userProfileRepository(Ref ref) {
  return UserProfileRepository(ref.watch(appDatabaseProvider));
}

// --- REPOSITORY ---
// This class encapsulates all the database logic for UserProfiles.
// Our UI will interact with this repository, not the database directly.
class UserProfileRepository {
  final AppDatabase _db;
  UserProfileRepository(this._db);

  // Method to create or update the user profile.
  // We use `insertOnConflictUpdate` because there's only one user profile (ID 1).
  Future<void> saveProfile(UserProfile profile) async {
    await _db.into(_db.userProfiles).insertOnConflictUpdate(profile);
  }

  // Method to get the user profile.
  Future<UserProfile?> getProfile() async {
    // We get the profile with ID 1. It might not exist on the first run.
    return (_db.select(_db.userProfiles)
          ..where((tbl) => tbl.id.equals(1)))
        .getSingleOrNull();
  }
}

// --- NEW REPOSITORY FOR TEMPLATES ---
@riverpod
ScholarshipTemplateRepository scholarshipTemplateRepository(Ref ref) {
  return ScholarshipTemplateRepository(ref.watch(appDatabaseProvider));
}

class ScholarshipTemplateRepository {
  final AppDatabase _db;
  ScholarshipTemplateRepository(this._db);

  // Method to find matching templates based on a user's profile
  // Watches the entire templates table for changes.
  Stream<List<ScholarshipTemplate>> watchAllTemplates() {
    return _db.select(_db.scholarshipTemplates).watch();
  }

  Future<List<ScholarshipTemplate>> findMatchingTemplates(UserProfile profile) async {
    // Artificial delay to simulate a network call and show our loading animation
    await Future.delayed(const Duration(seconds: 3));

    if (profile.studyLevel == null || profile.fieldOfStudy == null) {
      // If profile is incomplete, return all templates
      return _db.select(_db.scholarshipTemplates).get();
    }


    // Build a dynamic query
    final query = _db.select(_db.scholarshipTemplates)
      ..where((tbl) {
        // Study Level check: "S2" is contained in "S1,S2,S3"
        final studyLevelMatch = tbl.studyLevels.contains(profile.studyLevel!);
        // Field of study check: template is for 'All' OR contains the user's major
        final fieldOfStudyMatch = tbl.fieldsOfStudy.equals('All') | 
                                tbl.fieldsOfStudy.contains(profile.fieldOfStudy!);
        
        return studyLevelMatch & fieldOfStudyMatch;
      });
    
    return query.get();
  }
}

// --- NEW DATA CLASS for Joined Data ---
class ApplicationWithTemplate {
  final Application application;
  final ScholarshipTemplate template;

  ApplicationWithTemplate({required this.application, required this.template});
}

// --- NEW REPOSITORY FOR APPLICATIONS ---
@riverpod
ApplicationRepository applicationRepository(Ref ref) {
  return ApplicationRepository(ref.watch(appDatabaseProvider));
}

class ApplicationRepository {
  final AppDatabase _db;
  ApplicationRepository(this._db);

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

  // Creates a new Application in the database from a given template ID.
  Future<void> createApplicationFromTemplate(String templateId) async {
    final newApplicationCompanion = ApplicationsCompanion(
      templateId: Value(templateId),
      deadline: Value(DateTime.now().add(const Duration(days: 90))),
      status: const Value('in_progress'),
    );
    
    // Insert the application and get its newly generated ID
    final newApplication = await _db.into(_db.applications).insertReturning(newApplicationCompanion);

    // Seed default tasks with categories
    final defaultTasks = [
      TasksCompanion.insert(applicationId: newApplication.id,
      title: 'Prepare CV/Resume', category: const Value('Personal'), 
      dueDate: Value(DateTime.now().add(const Duration(days: 15)))),
      TasksCompanion.insert(applicationId: newApplication.id,
      title: 'Write Personal Statement', 
      category: const Value('Personal'), 
      dueDate: Value(DateTime.now().add(const Duration(days: 30)))),
      TasksCompanion.insert(
        applicationId: newApplication.id,
        title: 'Scan Passport',
        category: const Value('Personal'),
      ),
      TasksCompanion.insert(
        applicationId: newApplication.id,
        title: 'Request Recommendation Letters',
        category: const Value('Academic'),
      ),
      TasksCompanion.insert(
        applicationId: newApplication.id,
        title: 'Translate Academic Transcript',
        category: const Value('Academic'),
      ),
      TasksCompanion.insert(
        applicationId: newApplication.id,
        title: 'Get TOEFL/IELTS Certificate',
        category: const Value('Academic'),
      ),
      TasksCompanion.insert(
        applicationId: newApplication.id,
        title: 'Prepare Financial Statements',
        category: const Value('Financial'),
      ),

    ];

    await _db.batch((batch) {
      batch.insertAll(_db.tasks, defaultTasks);
    });
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
