// lib/features/applications/domain/milestone_extensions.dart
import 'package:saku_beasiswa/core/database/app_database.dart';
import 'package:saku_beasiswa/features/applications/domain/milestone_status.dart';

// We are adding a new getter called 'status' to the UserMilestone class
extension UserMilestoneStatus on UserMilestone {
  
  // This is now a getter, not a method. It needs the list of tasks to do its calculation.
  MilestoneStatus getStatus(List<UserTask> tasks) {
    if (tasks.isNotEmpty && tasks.every((t) => t.isCompleted)) {
      return MilestoneStatus.completed;
    }
    
    final now = DateTime.now();
    if (endDate.isBefore(now)) {
      return MilestoneStatus.overdue;
    }

    if (startDate.isBefore(now)) {
      return MilestoneStatus.inProgress;
    }
    
    return MilestoneStatus.notStarted;
  }
}
