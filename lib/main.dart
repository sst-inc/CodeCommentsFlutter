import 'package:code_comments_flutter/android/Calendar/scheduling.dart';
import 'package:code_comments_flutter/android/Courses/courses.dart';
import 'package:code_comments_flutter/android/Messaging/chats.dart';
import 'package:flutter/material.dart';

import 'android/Settings/settings.dart';
import 'android/homescreen.dart';
import 'android/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScaffoldMaterial();
  }
}

class ScaffoldMaterial extends StatefulWidget {
  const ScaffoldMaterial({Key? key}) : super(key: key);

  @override
  State<ScaffoldMaterial> createState() => _ScaffoldMaterialState();
}

class _ScaffoldMaterialState extends State<ScaffoldMaterial> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: Scaffold(
        body: _selectedIndex == 0
            ? const MyHomePage()
            : (_selectedIndex == 1
                ? const ChatsPage()
                : (_selectedIndex == 2
                    ? const SchedulingView()
                    : (_selectedIndex == 3
                        ? const CoursesPage()
                        : const SettingsPage()))),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble,
              ),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
              ),
              label: 'Scheduling',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
              ),
              label: "Courses",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
        ),
      ),
    );
  }
}
