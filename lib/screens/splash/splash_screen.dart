// ============================================================
//  splash_screen.dart
// ============================================================
//
//  LEARNING TOPICS:
//  1. StatefulWidget vs StatelessWidget
//     • Use StatefulWidget when the widget needs to change over time
//       (timers, animations, loading states …).
//     • Use StatelessWidget when the widget never changes after build.
//
//  2. initState()
//     Called ONCE when the widget is first inserted into the tree.
//     Perfect for starting a timer or fetching initial data.
//
//  3. mounted check
//     After an async gap (await / Future.delayed), the widget might
//     have been removed from the tree. Always check [mounted] before
//     calling setState or navigating.
//
//  4. context.goNamed()
//     Replaces the current route — the user cannot go "back" to splash.
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

/// [SplashScreen] is the very first screen the user sees.
/// It shows a logo for 2 seconds, then navigates to Home.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  // StatefulWidget always has a companion State class.
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // ── Lifecycle: initState ───────────────────────────────────
  @override
  void initState() {
    super.initState(); // always call super first!
    _startTimer();     // kick off our 2-second wait
  }

  /// Waits 2 seconds then navigates to the Home screen.
  Future<void> _startTimer() async {
    // Wait for 2 seconds without blocking the UI thread.
    await Future.delayed(const Duration(seconds: 2));

    // IMPORTANT: After the delay the widget might be gone.
    // 'mounted' is false if the widget was removed (e.g. hot restart).
    if (!mounted) return;

    // context.goNamed REPLACES this route — the user cannot
    // press back to return to the splash screen.
    context.goNamed(AppRoutes.homeName);
  }

  // ── Build ──────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background — purely aesthetic
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo
              FlutterLogo(size: 100),
              SizedBox(height: 24),

              // App title
              Text(
                'Routes & Navigation',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),

              // Subtitle
              Text(
                'Learning go_router step by step',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              SizedBox(height: 40),

              // Loading indicator
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
