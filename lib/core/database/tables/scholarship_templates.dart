import 'package:drift/drift.dart';

@DataClassName('ScholarshipTemplate')
class ScholarshipTemplates extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get providerName => text().named('provider_name')();
  TextColumn get logoUrl => text().nullable()();
  TextColumn get studyLevels => text()();
  TextColumn get fieldsOfStudy => text().named('fields_of_study')();
  TextColumn get targetCountries => text().named('target_countries')();
  TextColumn get description => text().nullable()();
  TextColumn get website => text().nullable()();
  TextColumn get region => text().withDefault(const Constant('International'))();
  TextColumn get defaultStages => text().named('default_stages').nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
