import 'package:code_comments_flutter/chats.dart';

import 'settings.dart';
import 'themes.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

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
        appBar: AppBar(
          title: _selectedIndex == 0
              ? const Text("Home")
              : (_selectedIndex == 1
              ? const Text("Chats")
              : const Text("Settings")),
        ),
        body: _selectedIndex == 0
            ? MyHomePage()
            : (_selectedIndex == 1
            ? const ChatsPage()
            : const SettingsPage()),
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
