// lib/core/database/tables/scholarship_templates.dart
import 'package:drift/drift.dart';

@DataClassName('ScholarshipTemplate')
class ScholarshipTemplates extends Table {
  // --- CORE METADATA ---
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get providerName => text().named('provider_name')();
  TextColumn get shortDescription => text().nullable()();
  TextColumn get longDescription => text().nullable()();

  // --- LOCATION & STUDY INFO ---
  TextColumn get country => text().nullable()();
  TextColumn get studyLevel => text()(); // "S1", "S2", "S3"
  TextColumn get fieldOfStudy => text().nullable()();

  // --- FINANCIAL INFO ---
  TextColumn get fundingType => text().nullable()(); // "full", "partial", "tuition_only"
  TextColumn get fundingAmount => text().nullable()(); // Flexible text field

  // --- DATES ---
  DateTimeColumn get applicationDeadline => dateTime().nullable()();
  DateTimeColumn get programStartDate => dateTime().nullable()();
  IntColumn get applicationDurationMonths => integer().nullable()();

  // --- REQUIREMENTS ---
  TextColumn get eligibility => text().nullable()();
  TextColumn get requiredGPA => text().nullable()();
  TextColumn get languageRequirements => text().nullable()();

  // --- UI CUSTOMIZATION ---
  TextColumn get color => text().named('default_color').nullable()();
  TextColumn get icon => text().nullable()();
  TextColumn get website => text().named('official_url').nullable()();

  // --- METADATA ---
  IntColumn get version => integer().withDefault(const Constant(1))();
  DateTimeColumn get lastUpdated => dateTime().nullable()();
  TextColumn get author => text().nullable()();

  // --- USAGE STATS (DIBUAT NULLABLE) ---
  IntColumn get usageCount => integer().nullable()();
  IntColumn get successRate => integer().nullable()();
  RealColumn get averageMatchScore => real().nullable()();

  // --- TEMPLATE STATUS ---
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isFeatured => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
