import 'dart:io' show Platform;

import 'package:code_comments_flutter/android/Calendar/scheduling.dart';
import 'package:code_comments_flutter/android/Courses/courses.dart';
import 'package:code_comments_flutter/android/Messaging/chats.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'android/Settings/settings.dart';
import 'android/homescreen.dart';
import 'android/themes.dart';
import 'firebase_options.dart';

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

  void _onItemTapped(int index, [bool? openSettingsInEditor]) {
    setState(() {
      _selectedIndex = index;
    });

    if (openSettingsInEditor != null) {
      setState(() {
        openSettingsInEditMode = openSettingsInEditor;

        listOfScreens = [
          HomePage(outerScaffoldKey: scaffoldKey),
          ChatsPage(outerScaffoldKey: scaffoldKey),
          SchedulingView(outerScaffoldKey: scaffoldKey),
          CoursesPage(outerScaffoldKey: scaffoldKey),
          SettingsPage(
              outerScaffoldKey: scaffoldKey,
              openInEditMode: openSettingsInEditMode)
        ];
      });
    }
  }

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
      SchedulingView(outerScaffoldKey: scaffoldKey),
      CoursesPage(outerScaffoldKey: scaffoldKey),
      SettingsPage(
          outerScaffoldKey: scaffoldKey, openInEditMode: openSettingsInEditMode)
    ];
  }

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

          listOfScreens = [
            HomePage(outerScaffoldKey: scaffoldKey),
            ChatsPage(outerScaffoldKey: scaffoldKey),
            SchedulingView(outerScaffoldKey: scaffoldKey),
            CoursesPage(outerScaffoldKey: scaffoldKey),
            SettingsPage(
                outerScaffoldKey: scaffoldKey,
                openInEditMode: openSettingsInEditMode)
          ];
        });
      }
    }

    if (kIsWeb) {
      return MaterialApp(); // The app is running on web
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
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
                surfaceTintColor: Theme
                    .of(context)
                    .primaryColor),
          ),
        );
      } else {
        return MaterialApp()
      }
    }
  }
}
