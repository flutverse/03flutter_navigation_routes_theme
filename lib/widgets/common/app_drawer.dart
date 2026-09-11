// ============================================================
//  app_drawer.dart  — Side navigation drawer
// ============================================================
//
//  LEARNING TOPICS:
//  1. Drawer widget — standard Material slide-in side menu.
//
//  2. Navigator.pop(context) BEFORE navigating.
//     The Drawer is an overlay on top of the current screen.
//     Calling pop() closes the drawer first, THEN we navigate.
//     Without it, the drawer would stay open during navigation.
//
//  3. context.goNamed() vs context.pushNamed() inside a Drawer
//     • Top-level destinations (Home, Profile, Settings) use goNamed
//       because each is a standalone screen, not a stack push.
//     • goNamed replaces the history — cleaner UX for a side menu.
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

/// [AppDrawer] is the slide-out navigation menu.
/// Add it to any Scaffold via:  drawer: const AppDrawer()
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // GoRouterState.of(context).uri.path gives the current route path.
    // We use it to highlight the active drawer item.
    final currentPath = GoRouterState.of(context).uri.path;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // removes default ListView top padding
        children: [

          // ── Drawer Header ────────────────────────────────
          // DrawerHeader fills the top area with a coloured block.
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, size: 36, color: Colors.white),
                ),
                const SizedBox(height: 8),
                const Text('Flutter Learner',
                    style: TextStyle(color: Colors.white,
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text('learner@flutter.dev',
                    style: TextStyle(color: Colors.white.withAlpha(180),
                        fontSize: 12)),
              ],
            ),
          ),

          // ── Navigation Items ─────────────────────────────
          _DrawerItem(
            icon: Icons.home_outlined,
            label: 'Home',
            routeName: AppRoutes.homeName,
            routePath: AppRoutes.home,
            currentPath: currentPath,
          ),
          _DrawerItem(
            icon: Icons.person_outline,
            label: 'Profile',
            routeName: AppRoutes.profileName,
            routePath: AppRoutes.profile,
            currentPath: currentPath,
          ),
          _DrawerItem(
            icon: Icons.settings_outlined,
            label: 'Settings',
            routeName: AppRoutes.settingsName,
            routePath: AppRoutes.settings,
            currentPath: currentPath,
          ),

          const Divider(),

          // ── Logout ───────────────────────────────────────
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);            // 1. close drawer
              context.goNamed(AppRoutes.loginName); // 2. go to login
            },
          ),

          // ── Learning note inside the drawer ──────────────
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '💡 Tip: Each item uses context.goNamed() which\n'
              'replaces the stack — no back-navigation between\n'
              'top-level destinations.',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

/// A single item in the drawer — highlights when active.
class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.routeName,
    required this.routePath,
    required this.currentPath,
  });

  final IconData icon;
  final String label;
  final String routeName;
  final String routePath;
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    // Highlight the item if the current URL starts with this path.
    final isActive = currentPath.startsWith(routePath);

    return ListTile(
      selected: isActive,
      selectedTileColor:
          Theme.of(context).colorScheme.primaryContainer.withAlpha(80),
      leading: Icon(icon,
          color: isActive ? Theme.of(context).colorScheme.primary : null),
      title: Text(label,
          style: TextStyle(
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      onTap: () {
        // STEP 1: Close the drawer (it is an overlay on the screen)
        Navigator.pop(context);
        // STEP 2: Navigate to the selected screen
        context.goNamed(routeName);
      },
    );
  }
}
