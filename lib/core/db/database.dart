import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Import table definitions
import 'tables/users_table.dart';
import 'tables/test_scores_table.dart';
import 'tables/scholarships_table.dart';
import 'tables/user_saved_scholarships_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Users, TestScores, Scholarships, UserSavedScholarships])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Migration from version 1 to 2: Add new profile fields
          await m.addColumn(users, users.phoneNumber);
          await m.addColumn(users, users.dateOfBirth);
          await m.addColumn(users, users.city);
          await m.addColumn(users, users.expectedGraduation);
          await m.addColumn(users, users.profilePhotoPath);
        }
        if (from < 3) {
          // Migration from version 2 to 3: Add scholarship discovery feature
          await m.createTable(scholarships);
          await m.createTable(userSavedScholarships);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
