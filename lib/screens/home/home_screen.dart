// ============================================================
//  home_screen.dart
// ============================================================
//
//  LEARNING TOPICS:
//  1. context.goNamed()  with  pathParameters
//     Navigates using the route NAME and passes dynamic values.
//     Example:
//       context.goNamed('details', pathParameters: {'id': '42'});
//     Result URL: /home/details/42
//
//  2. context.pushNamed() vs context.goNamed()
//     • goNamed   → REPLACES the history stack (no back button)
//     • pushNamed → ADDS to the history stack  (back button works)
//     For a list → detail pattern, use pushNamed so users can go back.
//
//  3. Passing queryParameters (bonus)
//     You can also pass optional data that shows in the URL:
//       context.pushNamed('details',
//         pathParameters : {'id': '42'},
//         queryParameters: {'from': 'home'},   // ?from=home
//       );
//     Read with: state.uri.queryParameters['from']
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';
import '../../models/item_model.dart';
import '../../widgets/common/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Sample data — in a real app this would come from an API or database.
  static final List<ItemModel> _items = List.generate(
    12,
    (index) => ItemModel(
      id: 'item_',
      title: 'Lesson ',
      subtitle: _subtitles[index % _subtitles.length],
    ),
  );

  static const _subtitles = [
    'Named routes with go_router',
    'Passing path parameters',
    'Passing query parameters',
    'Nested routes & sub-paths',
    'Route guards & redirects',
    'GoRouterState explained',
    'ShellRoute for persistent UI',
    'Deep linking on mobile',
    'Web URL support',
    'Back button behaviour',
    'Transition animations',
    'Error / 404 handling',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📚 Routes & Navigation'),
        // actions appear on the right side of the AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Go to Profile',
            // LEARNING: context.pushNamed keeps the back button!
            onPressed: () => context.pushNamed(AppRoutes.profileName),
          ),
        ],
      ),

      // The Drawer slides in from the left.
      // Open it by swiping or pressing the hamburger icon.
      drawer: const AppDrawer(),

      body: Column(
        children: [
          // ── Info banner ─────────────────────────────────
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primaryContainer,
            padding: const EdgeInsets.all(12),
            child: Text(
              '💡 Tap any lesson card to navigate with a path parameter.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          // ── Item list ────────────────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    // Leading avatar shows the lesson number
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      child: Text(''),
                    ),
                    title: Text(item.title,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(item.subtitle),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),

                    // ── Navigation happens here ────────────
                    onTap: () {
                      // LEARNING: pushNamed keeps back-navigation.
                      // pathParameters fills in the ':id' placeholder.
                      context.pushNamed(
                        AppRoutes.detailsName,
                        pathParameters: {'id': item.id},
                        // Optional: you can also pass extra non-URL data:
                        // extra: item,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
