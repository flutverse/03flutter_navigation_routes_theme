// ============================================================
//  profile_screen.dart
// ============================================================
//  LEARNING: This screen is reached via context.pushNamed()
//  so the AppBar gets a back button automatically.
//  The router knows the previous route was 'home'.
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User avatar
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 55, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text('Flutter Learner',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('learner@flutter.dev',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 32),

            // Navigate to Settings from here
            OutlinedButton.icon(
              onPressed: () => context.pushNamed(AppRoutes.settingsName),
              icon: const Icon(Icons.settings),
              label: const Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
