import 'package:capstone_project/screens/profile_screen.dart';
import 'package:capstone_project/screens/quiz_screen.dart';
import 'package:capstone_project/screens/saved_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomeScreen homepage;
  late ProfileScreen profile;
  late SavedScreen saved;
  late QuizScreen quiz;

  @override
  void initState() {
    homepage = HomeScreen();
    saved = SavedScreen();
    profile = ProfileScreen();
    quiz = QuizScreen();
    pages = [homepage, quiz, saved, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.quiz_outlined, color: Colors.white),
          Icon(Icons.save_as_outlined, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
