// lib/core/database/tables/template_documents.dart
import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/tables/scholarship_templates.dart';
// NEW IMPORT for our enum
import 'package:saku_beasiswa/core/models/document_submission_type.dart';

@DataClassName('TemplateDocument')
class TemplateDocuments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();

  TextColumn get name => text()();
  BoolColumn get isOptional => boolean().withDefault(const Constant(false))();

  // --- NEW COLUMN ---
  // Captures the type of submission required for this document.
      IntColumn get submissionType => intEnum<DocumentSubmissionType>().withDefault(const Constant(1))(); // Default to DocumentSubmissionType.upload
}