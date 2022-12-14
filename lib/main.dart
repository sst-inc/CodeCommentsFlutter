import 'package:code_comments_flutter/Calendar/scheduling.dart';
import 'package:code_comments_flutter/Courses/courses.dart';
import 'package:code_comments_flutter/Messaging/chats.dart';
import 'package:code_comments_flutter/Settings/settings.dart';
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
  bool openSettingsInEditMode = false;

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index, bool? openSettingsInEditor) {
      setState(() {
        _selectedIndex = index;
        title = listOfTitles[_selectedIndex];
      });
      if (openSettingsInEditor != null) {
        setState(() {
          openSettingsInEditMode = openSettingsInEditor;
        });
      }
    }

    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          drawer: DrawerActions(onEditButtonPressed: _onItemTapped),
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
                onTap: (value) {
                  _onItemTapped(value, false);
                },
              )),
          body: TabBarView(
            children: [
              HomePage(),
              ChatsPage(),
              SchedulingView(),
              CoursesPage(),
              SettingsPage(openInEditMode: openSettingsInEditMode),
            ],
          ),
        ),
      ),
    );
  }
}
