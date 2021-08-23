import 'package:flutter/material.dart';
import 'package:leisurelounge/data/data.dart';
import 'package:leisurelounge/screens/home_screen.dart';
import 'package:leisurelounge/screens/screens.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    HomeScreen(
      key: PageStorageKey("homescreen"),
    ),
    MyListScreen(),
    //this is temporary code should be replaced in future
    ContentScreen(content: featuredcontent),
    SearchScreen(),
    ProfileScreen()
  ];

  final Map<String, IconData> _icons = {
    "home": Icons.home,
    "myList": Icons.list_rounded,
    "comingSoon": Icons.play_circle,
    "search": Icons.search_rounded,
    "profile": Icons.person
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          selectedFontSize: 12.0,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 10.0,
          backgroundColor: Colors.black,
          onTap: (index) => setState(() => _currentIndex = index),
          items: _icons
              .map((title, icon) => MapEntry(title,
                  BottomNavigationBarItem(icon: Icon(icon), label: title)))
              .values
              .toList()),
    );
  }
}
