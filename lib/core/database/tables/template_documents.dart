// lib/core/database/tables/template_documents.dart
import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/tables/scholarship_templates.dart';

@DataClassName('TemplateDocument')
class TemplateDocuments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();

  TextColumn get name => text()();
  BoolColumn get isOptional => boolean().withDefault(const Constant(false))();
}
