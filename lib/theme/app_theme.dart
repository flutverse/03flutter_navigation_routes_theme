// ============================================================
//  app_theme.dart  — Material 3 theme configuration
// ============================================================
//
//  LEARNING: ThemeData controls the visual appearance of every
//  widget in the app. We define it once here and pass it to
//  MaterialApp — no need to style widgets individually.
//
//  ColorScheme.fromSeed() generates a full 30-colour palette
//  from a single seed colour. This is the Material 3 way.
// ============================================================

import 'package:flutter/material.dart';

/// Holds the theme selection for the entire application.
final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);

class AppTheme {
  AppTheme.isDark(); // not instantiable

  /// Light theme — used when the device is in light mode.
  static ThemeData get lightTheme {
    return ThemeData(
      // Material 3 is the modern design system from Google.
      useMaterial3: true,

      // All colours are derived from this single seed colour.
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0057D9), // deep blue
        brightness: Brightness.light,
      ),

      // AppBar styling
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),

      // Card styling
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Input field styling (used in login form)
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
      ),
    );
  }

  /// Dark theme — used when the device is in dark mode.
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0057D9),
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
      ),
    );
  }
}
