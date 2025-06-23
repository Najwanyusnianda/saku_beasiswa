import 'package:drift/drift.dart';
import 'package:saku_beasiswa/core/database/tables/scholarship_templates.dart';
import 'package:saku_beasiswa/core/enums/document_status.dart';



// NEW IMPORT: We now need to reference ScholarshipTemplates




// The user's specific instance of an application
@DataClassName('UserApplication')
class UserApplications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get templateId => text().references(ScholarshipTemplates, #id)();
  
  TextColumn get customName => text()();
  TextColumn get customColor => text().nullable()();
  TextColumn get notes => text().nullable()();
  
  // A simple status, we can make this an enum later
  TextColumn get status => text().withDefault(const Constant('in_progress'))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// The user's milestones for this specific application, with concrete dates
@DataClassName('UserMilestone')
class UserMilestones extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userApplicationId => integer().references(UserApplications, #id)();
  
  TextColumn get name => text()();
  
  // Concrete start and end dates, calculated from offsets
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
}

// The user's tasks for a specific milestone
@DataClassName('UserTask')
class UserTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userMilestoneId => integer().references(UserMilestones, #id)();

  TextColumn get label => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  
  // Concrete due date, calculated from milestone end + task offset
  DateTimeColumn get dueDate => dateTime()();
}




@DataClassName('UserDocument')
class UserDocuments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userApplicationId => integer().references(UserApplications, #id)();
  
  // The name of the document, e.g., "Scan Ijazah S1"
  TextColumn get name => text()();
  
  // The current status of this document for this application
  IntColumn get status => intEnum<DocumentStatus>().withDefault(const Constant(0))();
  
  // Optional notes specific to this document
  TextColumn get notes => text().nullable()();
}
