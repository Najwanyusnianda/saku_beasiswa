import 'package:flutter/material.dart';
import '../app_colors.dart';

class ProgressThemes {
  static ProgressIndicatorThemeData get progressIndicator =>
      const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.surfaceVariant,
        circularTrackColor: AppColors.surfaceVariant,
        refreshBackgroundColor: AppColors.surface,
        linearMinHeight: 4.0,
      );

  static ProgressIndicatorThemeData get progressIndicatorDark =>
      progressIndicator.copyWith(
        color: AppColors.primaryLight,
        linearTrackColor: AppColors.onSurface.withOpacity(0.24),
        circularTrackColor: AppColors.onSurface.withOpacity(0.24),
        refreshBackgroundColor: AppColors.onSurface,
      );
}
