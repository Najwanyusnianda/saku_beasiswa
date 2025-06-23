// lib/features/applications/domain/application_status.dart
import 'package:flutter/material.dart';
import 'package:saku_beasiswa/core/constants/app_colors.dart'; // Make sure this path is correct

enum ApplicationStatus {
  onTrack(label: 'On Track', color: AppColors.success),
  atRisk(label: 'At Risk', color: AppColors.warning),
  overdue(label: 'Overdue', color: AppColors.error);

  const ApplicationStatus({required this.label, required this.color});
  final String label;
  final Color color;
}
