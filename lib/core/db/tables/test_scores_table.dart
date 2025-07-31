import 'package:drift/drift.dart';
import 'users_table.dart';

class TestScores extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id, onDelete: KeyAction.cascade)();
  TextColumn get testType => text()(); // e.g., 'ielts', 'toefl'
  RealColumn get overallScore => real()();
  DateTimeColumn get testDate => dateTime()();
  TextColumn get detailedScores => text().nullable()(); // JSON string for sub-scores
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
