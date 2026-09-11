// ============================================================
//  app_routes.dart  — Central registry of every route
// ============================================================
//
//  PROBLEM without this file:
//    context.go('/hme');  // ← typo! crashes at runtime
//
//  SOLUTION — use constants:
//    context.goNamed(AppRoutes.homeName);  // ← compile-time safe!
//
//  RULE: Never hard-code a route string anywhere else in the app.
//        Always reference a constant from this file.
// ============================================================

/// Holds every route path and name as compile-time constants.
///
/// A route has two identifiers:
///   • [path]  — the URL segment  e.g. '/home'
///   • [name]  — a short label    e.g. 'home'
///
/// You navigate with the NAME (context.goNamed) so paths can
/// change without touching every screen that navigates to them.
class AppRoutes {
  // Private constructor — this class is never instantiated.
  AppRoutes._();

  // ── Route Paths ──────────────────────────────────────────
  // These are the URL segments go_router matches against.

  /// The initial (splash) screen.
  static const String splash = '/';

  /// Authentication screen.
  static const String login = '/login';

  /// Home screen — the main hub.
  static const String home = '/home';

  /// Details screen with a DYNAMIC segment (:id).
  /// The ':id' part will be replaced by a real value at runtime,
  /// e.g.  /home/details/42
  static const String details = '/home/details/:id';

  /// Profile screen.
  static const String profile = '/profile';

  /// Settings screen.
  static const String settings = '/settings';

  // ── Relative paths (used inside nested/child routes) ─────
  // When a GoRoute is nested inside another GoRoute, the child
  // only declares the part AFTER the parent's path.
  //
  // Parent path:  /home
  // Relative:      details/:id
  // Final URL:    /home/details/:id   ✔
  static const String detailsRelative = 'details/:id';

  // ── Named Route Identifiers ───────────────────────────────
  // These short strings are used with context.goNamed('home').
  // Names must be UNIQUE across the whole router.
  static const String splashName   = 'splash';
  static const String loginName    = 'login';
  static const String homeName     = 'home';
  static const String detailsName  = 'details';
  static const String profileName  = 'profile';
  static const String settingsName = 'settings';
}
