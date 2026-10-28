import 'package:flutter/material.dart';

import 'views/calls_view.dart';
import 'views/chats_view.dart';
import 'views/peoples_view.dart';

void main() {
  runApp(const CallsApp());
}

/// Application root and visual theme.
class CallsApp extends StatelessWidget {
  const CallsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'People, Chats and Calls',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

/// Main screen containing the navigation bar and three tabs.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<String> _titles = const ['Peoples', 'Chats', 'Calls'];

  // IndexedStack keeps each tab alive when the user switches between them.
  final List<Widget> _views = const [PeoplesView(), ChatsView(), CallsView()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex]), centerTitle: false),
      body: IndexedStack(index: _selectedIndex, children: _views),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Peoples',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.phone_outlined),
            selectedIcon: Icon(Icons.phone),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}
