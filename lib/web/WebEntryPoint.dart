import 'package:code_comments_flutter/android/Miscellaneous/themes.dart';
import 'package:code_comments_flutter/web/webChats.dart';
import 'package:code_comments_flutter/web/webHome.dart';
import 'package:flutter/material.dart';

class WebApp extends StatefulWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: Scaffold(
        appBar: AppBar(
          title: (_selectedIndex == 0
              ? Text("Home")
              : (_selectedIndex == 1
                  ? Text("Chats")
                  : (_selectedIndex == 2
                      ? Text("Scheduling")
                      : (_selectedIndex == 3
                          ? Text("Courses")
                          : Text("Settings"))))),
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
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.chat),
                  label: Text('Chats'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.calendar_month),
                  label: Text('Scheduling'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.book),
                  label: Text('Courses'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),
            _selectedIndex == 0 ? HomeScreen() : ChatsPage()
          ],
        ),
      ),
    );
  }
}
