import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 1. Initial Route
      initialRoute: '/',

      // 2. Named Routes Table
      routes: {
        '/': (context) => const MainPage(),
        '/settings': (context) => const SettingsPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}

// ==================== MAIN PAGE (Contains BottomNav) ====================
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State {
  int _currentIndex = 0;

  // Bottom Navigation Tabs
  final List _pages = const [HomePage(), SearchPage(), ProfilePage()];

  // Titles for Bottom Navigation Tabs
  final List _titles = const ['Home', 'Search', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: const Color(0xFF4285F4),
        foregroundColor: Colors.white,
      ),

      // DRAWER: Navigates to external screens via pushNamed
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF4285F4)),
              accountName: Text('Md. Ariful Islam Khan'),
              accountEmail: Text('ariful@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Color(0xFF4285F4)),
              ),
            ),

            // Open Settings Screen via Named Route
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                Navigator.pushNamed(context, '/settings');
              },
            ),

            // Open About Screen via Named Route
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context); // Close Drawer
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),

      // Body updates based on BottomNavigationBar selection
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF4285F4),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ==================== BOTTOM NAV TABS ====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page', style: TextStyle(fontSize: 22)),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search Page', style: TextStyle(fontSize: 22)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page', style: TextStyle(fontSize: 22)),
    );
  }
}

// ==================== SEPARATE DRAWER PAGES ====================
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF4285F4),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Settings Screen Content', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF4285F4),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('About Screen Content', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
