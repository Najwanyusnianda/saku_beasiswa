import 'package:flutter/material.dart';
import '../app_colors.dart';

class AppBarThemes {
  static AppBarTheme get light => AppBarTheme(
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.onSurface,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 1,
    surfaceTintColor: AppColors.primary,
    shadowColor: AppColors.divider,
    titleTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.onSurface,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.onSurface,
      size: 24,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.onSurface,
      size: 24,
    ),
  );

  static AppBarTheme get dark => light.copyWith(
    backgroundColor: AppColors.onSurface,
    foregroundColor: AppColors.surface,
    titleTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.surface,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.surface,
      size: 24,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.surface,
      size: 24,
    ),
  );
}
