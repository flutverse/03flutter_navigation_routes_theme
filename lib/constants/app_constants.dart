// ============================================================
//  app_constants.dart  — App-wide constant values
// ============================================================
//
//  LEARNING: Using constants prevents magic numbers and strings
//  scattered throughout the codebase.
//
//  'static const' means:
//    • static → belongs to the CLASS, not an instance
//    • const  → evaluated at compile time (zero runtime cost)
// ============================================================

class AppConstants {
  AppConstants._(); // never instantiate this class

  // ── App Info ─────────────────────────────────────────────
  static const String appName    = 'Flutter Routes & Navigation';
  static const String appVersion = '1.0.0';

  // ── Durations ─────────────────────────────────────────────
  static const Duration splashDelay    = Duration(seconds: 2);
  static const Duration animDuration   = Duration(milliseconds: 300);

  // ── Layout ────────────────────────────────────────────────
  static const double paddingSmall  = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge  = 24.0;
  static const double borderRadius  = 12.0;
}
