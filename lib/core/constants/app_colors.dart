import 'package:flutter/material.dart';

// A utility class to hold all the colors for our app.
// The private constructor `_()` prevents instantiation of this class.
class AppColors {
  AppColors._();

  // --- PRIMARY ---
  static const Color primary = Color(0xFF2563EB);

  // --- STATUS ---
  static const Color success = Color(0xFF059669);
  static const Color warning = Color(0xFFD97706);
  static const Color error = Color(0xFFDC2626);

  // --- NEUTRALS ---
  static const Color background = Color(0xFFF8FAFC); // Light gray for minimal look
  static const Color surface = Colors.white; // For cards, dialogs, etc.
  static const Color outline = Color(0xFFE2E8F0);

  // --- TEXT ---
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);
}
