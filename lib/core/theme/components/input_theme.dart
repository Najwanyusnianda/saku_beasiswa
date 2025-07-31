import 'package:flutter/material.dart';
import '../app_colors.dart';

class InputThemes {
  static InputDecorationTheme get input => InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceVariant,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.border,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.border,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.error,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.error,
        width: 2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.border.withOpacity(0.38),
        width: 1,
      ),
    ),
    labelStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceVariant,
    ),
    floatingLabelStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
    ),
    hintStyle: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceVariant.withOpacity(0.6),
    ),
    errorStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.error,
    ),
    helperStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceVariant,
    ),
    prefixIconColor: AppColors.onSurfaceVariant,
    suffixIconColor: AppColors.onSurfaceVariant,
  );

  static CheckboxThemeData get checkbox => CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return AppColors.surface;
    }),
    checkColor: MaterialStateProperty.all(AppColors.onPrimary),
    overlayColor: MaterialStateProperty.all(AppColors.primary.withOpacity(0.12)),
    splashRadius: 20,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  static RadioThemeData get radio => RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return AppColors.onSurfaceVariant;
    }),
    overlayColor: MaterialStateProperty.all(AppColors.primary.withOpacity(0.12)),
    splashRadius: 20,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  static SwitchThemeData get switchTheme => SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.onPrimary;
      }
      return AppColors.onSurfaceVariant;
    }),
    trackColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return AppColors.surfaceVariant;
    }),
    overlayColor: MaterialStateProperty.all(AppColors.primary.withOpacity(0.12)),
    splashRadius: 20,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  static SliderThemeData get slider => SliderThemeData(
    activeTrackColor: AppColors.primary,
    inactiveTrackColor: AppColors.primary.withOpacity(0.24),
    thumbColor: AppColors.primary,
    overlayColor: AppColors.primary.withOpacity(0.12),
    valueIndicatorColor: AppColors.primary,
    valueIndicatorTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.onPrimary,
    ),
  );
}
