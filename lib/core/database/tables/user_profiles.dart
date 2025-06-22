// lib/core/database/tables/user_profiles.dart
import 'package:drift/drift.dart';

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
