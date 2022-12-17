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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
    if (kIsWeb) {
      return MaterialApp(); // The app is running on web
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        // TODO: Remove iOS from here as this code means that this will be shown on ios
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
      } else {
        return Text("Not Implemented");
      }
    }
  }
}
