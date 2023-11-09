import 'package:aplikasi/bmi.dart';
import 'package:aplikasi/graphicPage.dart';
import 'package:aplikasi/mainpage.dart';
import 'package:aplikasi/profilepage.dart';
import 'package:aplikasi/toolspage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 180, 105, 105),
        color: Colors.pinkAccent,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.apps_rounded, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
          Icon(Icons.graphic_eq, size: 30, color: Colors.white),
          Icon(Icons.scale, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: <Widget>[
        Container(
          child: const MainPage(),
        ),
        Container(
          child: const ToolsPage(),
        ),
        Container(
          child: const ProfilePage(),
        ),
        Container(
          child: const GrafikTab(),
        ),
        Container(
          child: const BMICalculatorPage(),
        ),
      ][currentIndex],
    );
  }
}
