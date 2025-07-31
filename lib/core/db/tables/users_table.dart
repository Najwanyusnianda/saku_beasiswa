import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text()();
  TextColumn get email => text().unique()();
  TextColumn get phoneNumber => text().nullable()();
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get currentEducationLevel => text()();
  TextColumn get institution => text()();
  TextColumn get majorField => text()();
  RealColumn get currentGpa => real().nullable()();
  DateTimeColumn get expectedGraduation => dateTime().nullable()();
  TextColumn get profilePhotoPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
