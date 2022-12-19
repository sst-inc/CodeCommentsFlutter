import 'package:code_comments_flutter/android/Calendar/scheduling.dart';
import 'package:code_comments_flutter/android/Courses/courses.dart';
import 'package:code_comments_flutter/android/Messaging/chats.dart';
import 'package:code_comments_flutter/android/Miscellaneous/HamburgerMenu.dart';
import 'package:code_comments_flutter/android/Miscellaneous/themes.dart';
import 'package:code_comments_flutter/android/Settings/settings.dart';
import 'package:code_comments_flutter/android/homescreen.dart';
import 'package:code_comments_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatefulWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  State<AndroidApp> createState() => _AndroidAppState();
}

class _AndroidAppState extends State<AndroidApp> {
  int _selectedIndex = 0;
  bool openSettingsInEditMode = false;
  List<Widget> listOfScreens = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) {
      print(value);
    }).onError((error, stackTrace) {
      print("Firebase failed!");
    });

    listOfScreens = [
      HomePage(outerScaffoldKey: scaffoldKey),
      ChatsPage(outerScaffoldKey: scaffoldKey),
      SchedulingPage(outerScaffoldKey: scaffoldKey),
      CoursesPage(outerScaffoldKey: scaffoldKey),
      SettingsPage(
          outerScaffoldKey: scaffoldKey, openInEditMode: openSettingsInEditMode)
    ];
  }

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index, [bool? openSettingsInEditor]) {
      setState(() {
        _selectedIndex = index;
      });

      if (openSettingsInEditor != null) {
        setState(() {
          openSettingsInEditMode = openSettingsInEditor;

          listOfScreens = [
            HomePage(outerScaffoldKey: scaffoldKey),
            ChatsPage(outerScaffoldKey: scaffoldKey),
            SchedulingPage(outerScaffoldKey: scaffoldKey),
            CoursesPage(outerScaffoldKey: scaffoldKey),
            SettingsPage(
                outerScaffoldKey: scaffoldKey,
                openInEditMode: openSettingsInEditMode)
          ];
        });
      }
    }

    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: Scaffold(
        key: scaffoldKey,
        drawer: DrawerActions(
            onEditButtonPressed: onItemTapped,
            onChangeScreenNeeded: onItemTapped),
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
          onDestinationSelected: onItemTapped,
          selectedIndex: _selectedIndex,
          // surfaceTintColor: Theme.of(context).primaryColor,
          // backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
