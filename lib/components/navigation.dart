import 'package:flutter/material.dart';
import 'package:official_app/screens/calendar.dart';
import 'package:official_app/screens/home.dart';
import 'package:official_app/screens/profile.dart';

class NavigationManager extends StatefulWidget {
  const NavigationManager({super.key});

  @override
  State<NavigationManager> createState() => _NavigationManagerState();
}

class _NavigationManagerState extends State<NavigationManager> {
  // map current page
  int currentIndex = 0;
  // page list
  final screens = const [
    CalendarScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];
  // initialize State
  @override
  void initState() {
    currentIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: Colors.white,
        ),
        child: NavigationBar(
          height: 70,
          selectedIndex: currentIndex,
          onDestinationSelected: (index) =>
              setState(() => currentIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.grey,
              ),
              label: 'Calendar',
              selectedIcon: Icon(Icons.calendar_month),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey,
              ),
              label: 'Home',
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.grey,
              ),
              label: 'You',
              selectedIcon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}
