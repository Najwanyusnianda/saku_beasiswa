import 'package:flutter/material.dart';
import '../app_colors.dart';

class NavigationThemes {
  static BottomNavigationBarThemeData get bottomNavigation =>
      BottomNavigationBarThemeData(
    backgroundColor: AppColors.surface,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.onSurfaceVariant,
    selectedLabelStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  );

  static NavigationBarThemeData get navigationBar => NavigationBarThemeData(
    backgroundColor: AppColors.surface,
    surfaceTintColor: AppColors.primary,
    elevation: 3,
    height: 80,
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        );
      }
      return const TextStyle(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurfaceVariant,
      );
    }),
    iconTheme: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const IconThemeData(
          color: AppColors.primary,
          size: 24,
        );
      }
      return const IconThemeData(
        color: AppColors.onSurfaceVariant,
        size: 24,
      );
    }),
    indicatorColor: AppColors.primary.withOpacity(0.12),
    indicatorShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );

  static TabBarThemeData get tabBar => TabBarThemeData(
    indicatorColor: AppColors.primary,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AppColors.primary,
    unselectedLabelColor: AppColors.onSurfaceVariant,
    labelStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    overlayColor: MaterialStateProperty.all(AppColors.primary.withOpacity(0.12)),
    splashFactory: InkRipple.splashFactory,
  );

  static DrawerThemeData get drawer => const DrawerThemeData(
    backgroundColor: AppColors.surface,
    surfaceTintColor: AppColors.primary,
    elevation: 16,
    width: 304,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(16),
      ),
    ),
  );

  static ListTileThemeData get listTile => ListTileThemeData(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    tileColor: AppColors.surface,
    selectedTileColor: AppColors.primary.withOpacity(0.12),
    selectedColor: AppColors.primary,
    iconColor: AppColors.onSurfaceVariant,
    textColor: AppColors.onSurface,
    titleTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.onSurface,
    ),
    subtitleTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceVariant,
    ),
    leadingAndTrailingTextStyle: const TextStyle(
      fontFamily: 'Nunito',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceVariant,
    ),
  );
}
