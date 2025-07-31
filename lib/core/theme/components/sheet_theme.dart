import 'package:flutter/material.dart';
import '../app_colors.dart';

class SheetThemes {
  static BottomSheetThemeData get bottomSheet => BottomSheetThemeData(
    backgroundColor: AppColors.surface,
    surfaceTintColor: AppColors.primary,
    elevation: 8,
    modalElevation: 16,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    clipBehavior: Clip.antiAlias,
    constraints: const BoxConstraints(
      maxWidth: double.infinity,
    ),
  );

  static DialogThemeData get dialog => DialogThemeData(
    backgroundColor: AppColors.surface,
    surfaceTintColor: AppColors.primary,
    elevation: 24,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    titleTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.onSurface,
    ),
    contentTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceVariant,
    ),
  );

  static TimePickerThemeData get timePicker => TimePickerThemeData(
    backgroundColor: AppColors.surface,
    dialBackgroundColor: AppColors.surfaceVariant,
    dialHandColor: AppColors.primary,
    dialTextColor: AppColors.onSurface,
    entryModeIconColor: AppColors.primary,
    hourMinuteColor: AppColors.surfaceVariant,
    hourMinuteTextColor: AppColors.onSurface,
    dayPeriodColor: AppColors.surfaceVariant,
    dayPeriodTextColor: AppColors.onSurface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );

  static DatePickerThemeData get datePicker => DatePickerThemeData(
    backgroundColor: AppColors.surface,
    surfaceTintColor: AppColors.primary,
    elevation: 6,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    headerBackgroundColor: AppColors.primary,
    headerForegroundColor: AppColors.onPrimary,
    rangePickerBackgroundColor: AppColors.surface,
    rangeSelectionBackgroundColor: AppColors.primary.withOpacity(0.12),
    todayBackgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return AppColors.surface;
    }),
    todayForegroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.onPrimary;
      }
      return AppColors.primary;
    }),
  );
}
