import 'package:drift/drift.dart';

/// Scholarships table for storing scholarship data with optimized filtering columns
/// and full JSON data for detailed views
class Scholarships extends Table {
  /// Primary key
  IntColumn get id => integer().autoIncrement()();

  /// Unique identifier from the JSON file (e.g., "scholarship_001")
  TextColumn get jsonId => text().unique()();

  /// Scholarship title for quick display and search
  TextColumn get title => text()();

  /// Provider/Organization name (e.g., "University of Melbourne")
  TextColumn get provider => text()();

  /// Provider country for filtering (e.g., "Australia", "United States")
  TextColumn get providerCountry => text()();

  /// Application deadline for sorting and filtering
  DateTimeColumn get applicationDeadline => dateTime()();

  /// Funding type for filtering (e.g., "Full Scholarship", "Partial Funding")
  TextColumn get fundingType => text()();

  /// Target degree levels as JSON array string for filtering
  /// (e.g., '["Undergraduate", "Master"]')
  TextColumn get targetDegreeLevels => text()();

  /// Subject areas as JSON array string for filtering
  /// (e.g., '["Engineering", "Computer Science"]')
  TextColumn get subjectAreas => text().nullable()();

  /// Countries where the scholarship can be used
  /// (e.g., '["Australia", "New Zealand"]')
  TextColumn get studyCountries => text().nullable()();

  /// Minimum GPA requirement for quick filtering
  RealColumn get minGpa => real().nullable()();

  /// Language requirements as JSON string
  /// (e.g., '{"IELTS": 6.5, "TOEFL": 90}')
  TextColumn get languageRequirements => text().nullable()();

  /// Store the entire JSON object for the detail view
  /// This contains all the rich, nested data from the original JSON
  TextColumn get fullData => text()();

  /// When this record was created in the database
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// When this record was last updated
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
