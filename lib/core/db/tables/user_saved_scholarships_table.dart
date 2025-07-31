import 'package:drift/drift.dart';
import 'users_table.dart';
import 'scholarships_table.dart';

/// Junction table for tracking which scholarships a user has bookmarked/saved
/// This creates a many-to-many relationship between users and scholarships
class UserSavedScholarships extends Table {
  /// Reference to the user who saved the scholarship
  IntColumn get userId => integer().references(Users, #id, onDelete: KeyAction.cascade)();
  
  /// Reference to the saved scholarship
  IntColumn get scholarshipId => integer().references(Scholarships, #id, onDelete: KeyAction.cascade)();
  
  /// When the user saved this scholarship
  DateTimeColumn get savedAt => dateTime().withDefault(currentDateAndTime)();
  
  /// Composite primary key - a user can only save a scholarship once
  @override
  Set<Column> get primaryKey => {userId, scholarshipId};
}
