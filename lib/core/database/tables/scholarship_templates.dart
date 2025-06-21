import 'package:drift/drift.dart';

@DataClassName('ScholarshipTemplate')
class ScholarshipTemplates extends Table {
  // --- Core Metadata ---
  TextColumn get id => text()();
  TextColumn get name => text()(); // Corresponds to "title"
  TextColumn get providerName => text().named('provider_name')(); // Corresponds to "provider"
  TextColumn get shortDescription => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get studyLevel => text()();
  TextColumn get color => text().named('default_color').nullable()();
  TextColumn get website => text().named('official_url').nullable()();
  TextColumn get icon => text().nullable()();
  // --- NEW COLUMNS FOR PERSONALIZATION ---
  // TextColumn get customName => text().nullable()();
  // TextColumn get customColor => text().nullable()();
  // TextColumn get customIcon => text().nullable()();

  // --- Eligibility (simplified as text for now) ---
  TextColumn get eligibility => text().nullable()();

  // --- Versioning & Provenance ---
  IntColumn get version => integer().withDefault(const Constant(1))();
  DateTimeColumn get lastUpdated => dateTime().nullable()();
  TextColumn get author => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
