import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/view/profile_screen.dart';
import 'package:music_player/view/search_screen.dart';

import '../view/home_screen.dart';
import '../view/playlist_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final screens = const [
    HomeScreen(),
    SearchScreen(),
    PlayListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent.withOpacity(0.6),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.music_note), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: "")
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          }),
    );
  }
}
