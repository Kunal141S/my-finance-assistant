import 'package:flutter/material.dart';
import 'package:myfinanceassistant/screens/analysis.dart';
import 'package:myfinanceassistant/screens/cal_screen.dart';
import 'package:myfinanceassistant/screens/add_page.dart';
import 'package:myfinanceassistant/screens/others.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  List<Widget> myBody = [
    AddPage(),
    Analysis(),
    CalScreen(),
    Others(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Add',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.analytics_outlined),
      label: 'Analytics',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month),
      label: 'Calendar',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.circle_outlined),
      label: 'Other',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: bottomItems,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.amber,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: myBody[_selectedIndex],
      ),
    );
  }
}
