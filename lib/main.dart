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
  bool openSettingsInEditMode = false;
  List<Widget> listOfScreens = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listOfScreens = [
      HomePage(outerScaffoldKey: scaffoldKey),
      ChatsPage(outerScaffoldKey: scaffoldKey),
      SchedulingView(outerScaffoldKey: scaffoldKey),
      CoursesPage(outerScaffoldKey: scaffoldKey),
      SettingsPage(
          outerScaffoldKey: scaffoldKey, openInEditMode: openSettingsInEditMode)
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index, [bool? openSettingsInEditor]) {
      setState(() {
        _selectedIndex = index;
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
      home: Scaffold(
        key: scaffoldKey,
        drawer: DrawerActions(
            onEditButtonPressed: _onItemTapped,
            onChangeScreenNeeded: _onItemTapped),
        body: listOfScreens[_selectedIndex],
        bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.messenger),
                label: 'Chats',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_month),
                label: 'Scheduling',
              ),
              NavigationDestination(
                icon: Icon(Icons.book),
                label: 'Courses',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            onDestinationSelected: _onItemTapped,
            selectedIndex: _selectedIndex,
            surfaceTintColor: Theme.of(context).primaryColor),
      ),
    );
  }
}
