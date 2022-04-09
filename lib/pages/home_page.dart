import 'package:flutter/material.dart';
import 'package:task_manager/pages/calendar_page.dart';
import 'package:task_manager/pages/checked_page.dart';
import 'package:task_manager/pages/search_page.dart';
import 'package:task_manager/pages/tasks_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  final _pages = [TasksPage(), SearchPage(), CheckedPage(), CalendarPage()];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25.0,
        showUnselectedLabels: false,
        // unselectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedIconTheme: IconThemeData(size: 27),
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Check"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded), label: "Calendar"),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
