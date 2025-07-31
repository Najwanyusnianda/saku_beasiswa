import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  // Font family constant
  static const String _fontFamily = 'Nunito';

  // Light Theme Typography
  static TextTheme get lightTextTheme {
    return TextTheme(
      displayLarge: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: AppColors.onBackground,
        letterSpacing: -0.25,
      ),
      displayMedium: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: AppColors.onBackground,
        letterSpacing: 0,
      ),
      displaySmall: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: AppColors.onBackground,
        letterSpacing: 0,
      ),
      headlineLarge: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.onBackground,
        letterSpacing: 0,
      ),
      headlineMedium: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.onBackground,
        letterSpacing: 0,
      ),
      headlineSmall: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.onBackground,
        letterSpacing: 0,
      ),
      titleLarge: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.onBackground,
        letterSpacing: 0,
      ),
      titleMedium: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.onBackground,
        letterSpacing: 0.15,
      ),
      titleSmall: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.onBackground,
        letterSpacing: 0.1,
      ),
      bodyLarge: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.onBackground,
        letterSpacing: 0.5,
      ),
      bodyMedium: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
        letterSpacing: 0.25,
      ),
      bodySmall: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurfaceVariant,
        letterSpacing: 0.4,
      ),
      labelLarge: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
        letterSpacing: 0.1,
      ),
      labelMedium: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
        letterSpacing: 0.5,
      ),
      labelSmall: const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
        letterSpacing: 0.5,
      ),
    );
  }

  // Dark Theme Typography
  static TextTheme get darkTextTheme {
    return lightTextTheme.copyWith(
      displayLarge: lightTextTheme.displayLarge?.copyWith(
        color: AppColors.surface,
      ),
      displayMedium: lightTextTheme.displayMedium?.copyWith(
        color: AppColors.surface,
      ),
      displaySmall: lightTextTheme.displaySmall?.copyWith(
        color: AppColors.surface,
      ),
      headlineLarge: lightTextTheme.headlineLarge?.copyWith(
        color: AppColors.surface,
      ),
      headlineMedium: lightTextTheme.headlineMedium?.copyWith(
        color: AppColors.surface,
      ),
      headlineSmall: lightTextTheme.headlineSmall?.copyWith(
        color: AppColors.surface,
      ),
      titleLarge: lightTextTheme.titleLarge?.copyWith(
        color: AppColors.surface,
      ),
      titleMedium: lightTextTheme.titleMedium?.copyWith(
        color: AppColors.surface,
      ),
      titleSmall: lightTextTheme.titleSmall?.copyWith(
        color: AppColors.surface,
      ),
      bodyLarge: lightTextTheme.bodyLarge?.copyWith(
        color: AppColors.surface,
      ),
      bodyMedium: lightTextTheme.bodyMedium?.copyWith(
        color: AppColors.surface,
      ),
      bodySmall: lightTextTheme.bodySmall?.copyWith(
        color: AppColors.surfaceVariant,
      ),
      labelLarge: lightTextTheme.labelLarge?.copyWith(
        color: AppColors.surface,
      ),
      labelMedium: lightTextTheme.labelMedium?.copyWith(
        color: AppColors.surface,
      ),
      labelSmall: lightTextTheme.labelSmall?.copyWith(
        color: AppColors.surface,
      ),
    );
  }
}
