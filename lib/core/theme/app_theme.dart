import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'typography.dart';
import 'components/appbar_theme.dart';
import 'components/button_theme.dart';
import 'components/card_theme.dart';
import 'components/chip_theme.dart';
import 'components/input_theme.dart';
import 'components/navigation_theme.dart';
import 'components/progress_theme.dart';
import 'components/sheet_theme.dart';
import 'components/snackbar_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        background: AppColors.background,
        onBackground: AppColors.onBackground,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceVariant: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        error: AppColors.error,
      ),

      // Typography
      textTheme: AppTypography.lightTextTheme,

      // Component Themes
      appBarTheme: AppBarThemes.light,
      cardTheme: CardThemes.light,
      elevatedButtonTheme: ButtonThemes.elevatedButton,
      outlinedButtonTheme: ButtonThemes.outlinedButton,
      textButtonTheme: ButtonThemes.textButton,
      floatingActionButtonTheme: ButtonThemes.floatingActionButton,
      inputDecorationTheme: InputThemes.input,
      checkboxTheme: InputThemes.checkbox,
      radioTheme: InputThemes.radio,
      switchTheme: InputThemes.switchTheme,
      sliderTheme: InputThemes.slider,
      bottomNavigationBarTheme: NavigationThemes.bottomNavigation,
      navigationBarTheme: NavigationThemes.navigationBar,
      tabBarTheme: NavigationThemes.tabBar,
      drawerTheme: NavigationThemes.drawer,
      listTileTheme: NavigationThemes.listTile,
      chipTheme: ChipThemes.chip,
      snackBarTheme: SnackBarThemes.snackBar,
      progressIndicatorTheme: ProgressThemes.progressIndicator,
      bottomSheetTheme: SheetThemes.bottomSheet,
      dialogTheme: SheetThemes.dialog,
      timePickerTheme: SheetThemes.timePicker,
      datePickerTheme: SheetThemes.datePicker,

      // System UI
      splashColor: AppColors.primary.withOpacity(0.12),
      highlightColor: AppColors.primary.withOpacity(0.08),
      hoverColor: AppColors.primary.withOpacity(0.04),
      focusColor: AppColors.primary.withOpacity(0.12),
      dividerColor: AppColors.divider,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.surface,
      dialogBackgroundColor: AppColors.surface,
      indicatorColor: AppColors.primary,
      hintColor: AppColors.onSurfaceVariant.withOpacity(0.6),
      disabledColor: AppColors.onSurface.withOpacity(0.38),
      shadowColor: AppColors.divider,

      // Platform-specific adaptations
      platform: TargetPlatform.android,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,

      // Extensions
      extensions: <ThemeExtension<dynamic>>[
        // Add custom theme extensions here if needed
      ],
    );
  }

  static ThemeData get darkTheme {
    return lightTheme.copyWith(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryLight,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondaryLight,
        onSecondary: AppColors.onSecondary,
        background: AppColors.onSurface,
        onBackground: AppColors.surface,
        surface: AppColors.onSurface,
        onSurface: AppColors.surface,
        surfaceVariant: AppColors.onSurfaceVariant,
        onSurfaceVariant: AppColors.surfaceVariant,
        error: AppColors.error,
      ),

      // Dark theme overrides
      textTheme: AppTypography.darkTextTheme,
      appBarTheme: AppBarThemes.dark,
      cardTheme: CardThemes.dark,
      progressIndicatorTheme: ProgressThemes.progressIndicatorDark,
      scaffoldBackgroundColor: AppColors.onSurface,
      canvasColor: AppColors.onSurface,
      dialogBackgroundColor: AppColors.onSurface,
    );
  }

  static SystemUiOverlayStyle get lightSystemUiOverlayStyle {
    return const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.surface,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }

  static SystemUiOverlayStyle get darkSystemUiOverlayStyle {
    return const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.onSurface,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }
}
