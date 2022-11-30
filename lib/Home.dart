import 'package:flutter/scheduler.dart';

import 'themes.dart';
import 'package:flutter/material.dart';

import 'chats.dart';
import 'settings.dart';

var brightness = SchedulerBinding.instance.window.platformBrightness;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];

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
        appBar: AppBar(
          title: _selectedIndex == 0
              ? const Text("Home")
              : (_selectedIndex == 1
                  ? const Text("Chats")
                  : const Text("Settings")),
        ),
        body: _selectedIndex == 1 ? const ChatsPage() : const SettingsPage(),
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
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: brightness == Brightness.dark
              ? darkTheme(context).selectedRowColor
              : lightTheme(context).selectedRowColor,
        ),
      ),
    );
  }
}
