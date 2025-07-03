// lib/features/applications/domain/milestone_status.dart
import 'package:flutter/material.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart';

enum MilestoneStatus {
  completed(label: 'Completed', color: AppColors.success),
  inProgress(label: 'In Progress', color: AppColors.primary),
  overdue(label: 'Overdue', color: AppColors.error),
  notStarted(label: 'Not Started', color: Colors.grey);

  const MilestoneStatus({required this.label, required this.color});
  final String label;
  final Color color;
}
