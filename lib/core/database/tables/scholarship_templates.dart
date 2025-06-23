// lib/core/database/tables/scholarship_templates.dart
import 'package:drift/drift.dart';

@DataClassName('ScholarshipTemplate')
class ScholarshipTemplates extends Table {
  // --- CORE METADATA (These stay the same) ---
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get providerName => text().named('provider_name')();
  TextColumn get shortDescription => text().nullable()();
  TextColumn get longDescription => text().nullable()();

  // --- LOCATION & STUDY INFO (These stay the same) ---
  TextColumn get country => text().nullable()();
  TextColumn get studyLevel => text()(); // "S1", "S2", "S3"
  TextColumn get fieldOfStudy => text().nullable()();

  // --- FINANCIAL INFO (These stay the same) ---
  TextColumn get fundingType => text().nullable()();
  TextColumn get fundingAmount => text().nullable()();
  
  // --- UI & METADATA (These stay the same) ---
  TextColumn get color => text().named('default_color').nullable()();
  TextColumn get icon => text().nullable()();
  TextColumn get website => text().named('official_url').nullable()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  DateTimeColumn get lastUpdated => dateTime().nullable()();
  TextColumn get author => text().nullable()();
  IntColumn get usageCount => integer().nullable()();
  IntColumn get successRate => integer().nullable()();
  RealColumn get averageMatchScore => real().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isFeatured => boolean().withDefault(const Constant(false))();

  // --- REMOVED & REPLACED COLUMNS ---
  // The following columns are being removed from this table.
  // Their data will be stored in new, structured relational tables later.
  //
  // REMOVED: DateTimeColumn get applicationDeadline => dateTime().nullable()();
  // REMOVED: IntColumn get applicationDurationMonths => integer().nullable()();
  // REMOVED: TextColumn get eligibility => text().nullable()();
  // REMOVED: TextColumn get requiredGPA => text().nullable()();
  // REMOVED: TextColumn get languageRequirements => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}