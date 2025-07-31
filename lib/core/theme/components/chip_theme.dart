import 'package:flutter/material.dart';
import '../app_colors.dart';

class ChipThemes {
  static ChipThemeData get chip => ChipThemeData(
    backgroundColor: AppColors.surfaceVariant,
    disabledColor: AppColors.onSurface.withOpacity(0.12),
    selectedColor: AppColors.primary.withOpacity(0.12),
    secondarySelectedColor: AppColors.secondary.withOpacity(0.12),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
    labelStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.onSurface,
    ),
    secondaryLabelStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.onSecondary,
    ),
    brightness: Brightness.light,
    elevation: 0,
    pressElevation: 2,
    shadowColor: AppColors.divider,
    surfaceTintColor: AppColors.primary,
    side: const BorderSide(
      color: AppColors.border,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.onSurfaceVariant,
      size: 18,
    ),
    deleteIconColor: AppColors.onSurfaceVariant,
    checkmarkColor: AppColors.primary,
    selectedShadowColor: AppColors.divider,
    showCheckmark: true,
  );
}
