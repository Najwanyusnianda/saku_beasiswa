import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/core/database/repositories/application_repository.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

void main() {
  late AppDatabase database;
  late ProviderContainer container;
  late ApplicationRepository repository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    // Create a ProviderContainer for testing.
    // We override the appDatabaseProvider to use the in-memory database.
    container = ProviderContainer(
      overrides: [appDatabaseProvider.overrideWithValue(database)],
    );
    // Read the repository from the container. This correctly provides the Ref.
    repository = container.read(applicationRepositoryProvider);
  });

  tearDown(() async {
    await database.close();
    container.dispose();
  });

  test('Cascade shift correctly pushes future dates forward', () async {
    // --- ARRANGE ---
    // 1. Create a dummy application
    final app = await database.into(database.applications).insertReturning(
          ApplicationsCompanion.insert(templateId: 'test', deadline: DateTime(2025, 12, 31)),
        );

    // 2. Create dummy tasks with known dates
    final task1Date = DateTime(2025, 10, 1);
    final task2Date = DateTime(2025, 11, 1);
    final task3Date = DateTime(2025, 12, 1);

    final task1 = await database.into(database.tasks).insertReturning(
          TasksCompanion.insert(applicationId: app.id, title: 'Task 1', dueDate: Value(task1Date)),
        );
    await database.into(database.tasks).insertReturning(
          TasksCompanion.insert(applicationId: app.id, title: 'Task 2', dueDate: Value(task2Date)),
        );
    await database.into(database.tasks).insertReturning(
          TasksCompanion.insert(applicationId: app.id, title: 'Task 3', dueDate: Value(task3Date)),
        );

    // --- ACT ---
    // 3. Update Task 1's date by +10 days and apply cascade
    final newTask1Date = task1Date.add(const Duration(days: 10));
    await repository.updateTaskDueDate(task1.id, newTask1Date, cascade: true);

    // --- ASSERT ---
    // 4. Verify that tasks 2 and 3 have also shifted by +10 days
    final allTasks = await (database.select(database.tasks)..where((tbl) => tbl.applicationId.equals(app.id))).get();
    
    final finalTask1 = allTasks.firstWhere((t) => t.title == 'Task 1');
    final finalTask2 = allTasks.firstWhere((t) => t.title == 'Task 2');
    final finalTask3 = allTasks.firstWhere((t) => t.title == 'Task 3');
    
    expect(finalTask1.dueDate, equals(DateTime(2025, 10, 11))); // Shifted
    expect(finalTask2.dueDate, equals(DateTime(2025, 11, 11))); // Shifted
    expect(finalTask3.dueDate, equals(DateTime(2025, 12, 11))); // Shifted
  });
}