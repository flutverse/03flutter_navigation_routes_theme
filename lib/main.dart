// ============================================================
//  main.dart  — Entry point of the Flutter application
// ============================================================
//
//  KEY CONCEPT: Every Flutter app starts with main() → runApp().
//
//  ROUTING CHOICE:
//    • MaterialApp()         → uses Navigator 1.0  (push/pop)
//    • MaterialApp.router()  → uses Navigator 2.0  (go_router, auto_route…)
//
//  We use MaterialApp.router() because go_router gives us:
//    ✔ named routes           (no magic strings in UI code)
//    ✔ deep linking           (URLs on web, notifications on mobile)
//    ✔ nested routes          (tabs, shell routes)
//    ✔ route guards           (redirect to login if not authenticated)
// ============================================================

import 'package:flutter/material.dart';

// We import our own router and theme — defined in separate files
// to keep main.dart small and easy to understand.
import 'routes/app_router.dart';
import 'theme/app_theme.dart';

/// [main] is the first function Flutter calls.
void main() {
  runApp(const MyApp());
}

/// [MyApp] is the root widget.
/// It never changes after being built, so it extends StatelessWidget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) => MaterialApp.router(
      // ── App metadata ─────────────────────────────────────
      title: 'Flutter Routes & Navigation',
      debugShowCheckedModeBanner: false, // hides the red DEBUG ribbon

      // ── Themes ───────────────────────────────────────────
      // Flutter will pick lightTheme or darkTheme automatically
      // based on the device's system setting.
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      // ── Router ───────────────────────────────────────────
      // routerConfig replaces 'home:' when using Navigator 2.0.
      // AppRouter.router is a GoRouter instance we configure
      // inside lib/routes/app_router.dart.
      routerConfig: AppRouter.router,
      ),
    );
  }
}
