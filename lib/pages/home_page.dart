import 'package:flutter/material.dart';
import 'package:logletter/pages/best.dart';
import 'package:logletter/pages/bookmark.dart';
import 'package:logletter/pages/edit.dart';
import 'package:logletter/pages/home.dart';
import 'package:logletter/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // navigate around the bottom nav bar

  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _childern = [
    UserHome(),
    const UserBest(),
    const UserEdit(),
    const UserBookmark(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _childern[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ), // 선택된 라벨 스타일
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ), // 선택되지 않은 라벨 스타일
          onTap: _navigateBottomNavBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'logletter'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Best'),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'logging'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Sub'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ));
  }
}
