import 'package:code_comments_flutter/android/Miscellaneous/themes.dart';
import 'package:code_comments_flutter/web/webCourses.dart';
import 'package:code_comments_flutter/web/webHome.dart';
import 'package:code_comments_flutter/web/webLogin.dart';
import 'package:code_comments_flutter/web/webSettings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../android/Login/register.dart';
import '../main.dart';

class WebApp extends StatefulWidget {
  final bool isLoggedIn;

  const WebApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<WebApp> createState() => _WebAppState(isLoggedIn);
}

class _WebAppState extends State<WebApp> {
  _WebAppState(this.isLoggedIn);

  final bool isLoggedIn;

  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lightTheme(context),
        darkTheme: darkTheme(context),
        home: isLoggedIn == true
            ? Scaffold(
                appBar: AppBar(
                  title: (_selectedIndex == 0
                      ? Text("Home")
                      : (_selectedIndex == 1
                          ? Text("Courses")
                          : Text("Settings"))),
                ),
                body: Row(
                  children: <Widget>[
                    NavigationRail(
                      selectedIndex: _selectedIndex,
                      groupAlignment: groupAligment,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      labelType: labelType,
                      leading: showLeading
                          ? FloatingActionButton(
                              elevation: 0,
                              onPressed: () {
                                // Add your onPressed code here!
                              },
                              child: const Icon(Icons.add),
                            )
                          : const SizedBox(),
                      trailing: showTrailing
                          ? IconButton(
                              onPressed: () {
                                // Add your onPressed code here!
                              },
                              icon: const Icon(Icons.more_horiz_rounded),
                            )
                          : const SizedBox(),
                      destinations: const <NavigationRailDestination>[
                        NavigationRailDestination(
                          icon: Icon(Icons.house),
                          label: Text(
                            'Home',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.book),
                          label: Text(
                            'Courses',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.settings),
                          label: Text(
                            'Settings',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    _selectedIndex == 0
                        ? HomeScreen()
                        : (_selectedIndex == 1 ? webCourses() : WebSettings())
                  ],
                ),
              )
            : WebLoginScreen());
  }
}
