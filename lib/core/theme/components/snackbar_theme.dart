import 'package:flutter/material.dart';
import '../app_colors.dart';

class SnackBarThemes {
  static SnackBarThemeData get snackBar => SnackBarThemeData(
    backgroundColor: AppColors.onSurface,
    contentTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.surface,
    ),
    actionTextColor: AppColors.primary,
    disabledActionTextColor: AppColors.onSurfaceVariant,
    elevation: 6,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    behavior: SnackBarBehavior.floating,
    width: null,
    insetPadding: const EdgeInsets.all(16),
    showCloseIcon: false,
    closeIconColor: AppColors.surface,
  );

  static MaterialBannerThemeData get banner => MaterialBannerThemeData(
    backgroundColor: AppColors.warning,
    contentTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.onPrimary,
    ),
    elevation: 0,
    padding: const EdgeInsets.all(16),
    leadingPadding: const EdgeInsets.only(right: 16),
    dividerColor: AppColors.onPrimary.withOpacity(0.24),
    shadowColor: AppColors.divider,
    surfaceTintColor: AppColors.warning,
  );
}
