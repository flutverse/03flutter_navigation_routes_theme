// ============================================================
//  not_found_screen.dart  —  The 404 page
// ============================================================
//
//  LEARNING: When do you see this screen?
//
//  go_router's  errorBuilder: (context, state) => NotFoundScreen()
//  is called when:
//    • The user navigates to a URL that no GoRoute matches.
//    • On Flutter Web: the user types an unknown path in the browser.
//    • state.error contains the GoException with details.
//
//  Production tip: Log state.error to your crash reporter here.
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Big 404 number
              Text(
                '404',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.error,
                  height: 1,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Page Not Found',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text(
                'The route you navigated to does not exist.\n'
                'Check the URL or go back to the home screen.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),

              // Go home button — uses go() to clear the bad route
              ElevatedButton.icon(
                onPressed: () => context.goNamed(AppRoutes.homeName),
                icon: const Icon(Icons.home),
                label: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
