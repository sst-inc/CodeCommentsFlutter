import 'package:code_comments_flutter/Calendar/scheduling.dart';
import 'package:code_comments_flutter/Courses/courses.dart';
import 'package:code_comments_flutter/Messaging/chats.dart';
import 'package:code_comments_flutter/settings.dart';
import 'package:flutter/material.dart';

import 'Miscellaneous/HamburgerMenu.dart';
import 'homescreen.dart';
import 'themes.dart';

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
  List<String> listOfTitles = [
    "Home",
    "Chats",
    "Scheduling",
    "Courses",
    "Settings"
  ];
  String title = "Home";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      title = listOfTitles[_selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          drawer: DrawerActions(),
          appBar: AppBar(
              title: Text(title),
              centerTitle: false,
              bottom: TabBar(
                tabs: <Tab>[
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.messenger)),
                  Tab(icon: Icon(Icons.calendar_month)),
                  Tab(icon: Icon(Icons.book)),
                  Tab(icon: Icon(Icons.settings)),
                ],
                onTap: _onItemTapped,
              )),
          body: TabBarView(
            children: [
              MyHomePage(),
              ChatsPage(),
              SchedulingView(),
              CoursesPage(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
