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
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _childern[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomNavBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Best'),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edit'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'bookmark'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ],
        ));
  }
}
