import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home/home.dart';
import '../camera/cameraa.dart';
import '../profile/profile.dart';
import '../sumarize/sumarize.dart';
import '../translate/translate.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 2; // Default to the Home screen

  final List<Widget> _screens = [
    camera(),
    sumarize(),
    Home(),
    TranslateWidget(""),
    profile()
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.camera_fill,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.book,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.translate,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      label: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        backgroundColor: Color(0xFFD9D9D9),
        items: _bottomNavBarItems,
        selectedItemColor: Colors.green, // Change this color as needed
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}