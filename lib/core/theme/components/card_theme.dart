import 'package:flutter/material.dart';
import '../app_colors.dart';

class CardThemes {
  static CardThemeData get light => const CardThemeData(
    color: AppColors.surface,
    surfaceTintColor: AppColors.primary,
    shadowColor: AppColors.divider,
    elevation: 2,
    margin: EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    clipBehavior: Clip.antiAlias,
  );

  static CardThemeData get dark => light.copyWith(
    color: AppColors.onSurface,
    shadowColor: Colors.black.withOpacity(0.3),
  );
}
