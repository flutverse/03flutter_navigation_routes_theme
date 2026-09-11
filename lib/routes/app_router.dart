// ============================================================
//  app_router.dart  — GoRouter configuration
// ============================================================
//
//  go_router works like a tree of GoRoute objects.
//  Each GoRoute has:
//    • path    — the URL segment to match
//    • name    — a unique label (used with goNamed)
//    • builder — returns the Widget for this route
//    • routes  — child/nested routes (optional)
//
//  Navigation methods (quick reference):
//  ┌─────────────────────────────────────────────────────────┐
//  │ context.go('/home')          Push & REPLACE history     │
//  │ context.push('/home')        Push & KEEP history        │
//  │ context.goNamed('home')      Same as go, but by name    │
//  │ context.pushNamed('home')    Same as push, but by name  │
//  │ context.pop()                Go back (like Back button) │
//  │ context.canPop()             Returns true if can go back│
//  └─────────────────────────────────────────────────────────┘
// ============================================================

import 'package:go_router/go_router.dart';

import 'app_routes.dart';

// Screens
import '../screens/splash/splash_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/details/details_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/not_found/not_found_screen.dart';

/// [AppRouter] creates and holds the single [GoRouter] instance.
///
/// We make it a class with a private constructor so nobody can
/// accidentally create a second router.
class AppRouter {
  AppRouter._(); // ← prevents instantiation

  /// The single [GoRouter] used by [MaterialApp.router].
  static final GoRouter router = GoRouter(
    // ── Initial location ─────────────────────────────────
    // The path that loads when the app first opens.
    initialLocation: AppRoutes.splash,

    // ── Debug logging ────────────────────────────────────
    // Prints every navigation event to the console while debugging.
    // Set to false (or remove) before releasing to production.
    debugLogDiagnostics: true,

    // ── 404 fallback ─────────────────────────────────────
    // Shown when the user navigates to a path that doesn't exist.
    errorBuilder: (context, state) => const NotFoundScreen(),

    // ── Route table ──────────────────────────────────────
    routes: [

      // ROUTE 1 — Splash (initial loading screen)
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splashName,
        builder: (context, state) => const SplashScreen(),
      ),

      // ROUTE 2 — Login
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginName,
        builder: (context, state) => const LoginScreen(),
      ),

      // ROUTE 3 — Home (parent)
      //   └── ROUTE 3a — Details (child / nested)
      //
      // LEARNING: Nested routes share the parent's path prefix.
      // Navigating to 'details' automatically includes '/home/'.
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.homeName,
        builder: (context, state) => const HomeScreen(),

        // Child routes listed here are nested under /home
        routes: [
          GoRoute(
            path: AppRoutes.detailsRelative, // 'details/:id'
            name: AppRoutes.detailsName,
            builder: (context, state) {
              // LEARNING: Reading a dynamic path parameter.
              // If the URL is /home/details/42 then:
              //   state.pathParameters['id'] == '42'
              final String id = state.pathParameters['id'] ?? 'unknown';
              return DetailsScreen(id: id);
            },
          ),
        ],
      ),

      // ROUTE 4 — Profile
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profileName,
        builder: (context, state) => const ProfileScreen(),
      ),

      // ROUTE 5 — Settings
      GoRoute(
        path: AppRoutes.settings,
        name: AppRoutes.settingsName,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
