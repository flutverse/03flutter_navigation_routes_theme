// ============================================================
//  settings_screen.dart
// ============================================================
//  LEARNING: Simple screen with no navigation logic.
//  It relies on the AppBar's automatic back button.
//  Because it was pushed (not go'd), context.pop() is valid.
// ============================================================

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Section header
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text('PREFERENCES',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.grey, letterSpacing: 1.2)),
          ),
          
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            subtitle: const Text('Switch between light and dark theme'),
            value: false,
            onChanged: (_) {
              // TODO: connect to a ThemeNotifier / Provider / Riverpod
            },
          ),
          /*
           ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, themeMode, _) => SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              subtitle: const Text('Switch between light and dark theme'),
              value: themeMode == ThemeMode.dark,
              onChanged: (isDark) {
                themeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;
              },
            ),
          ),
          */
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('English'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text('ABOUT',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                    color: Colors.grey, letterSpacing: 1.2)),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('App Version'),
            trailing: Text('1.0.0', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
