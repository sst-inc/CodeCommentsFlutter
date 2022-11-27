import 'package:codecomments/themes.dart';
import 'package:flutter/material.dart';
import 'chats.dart';
import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});    

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      darkTheme: darkTheme,
      home: MyHomePage(),
    );
  }
}

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
      theme: theme,
      darkTheme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: _selectedIndex == 0
              ? Text("Home")
              : (_selectedIndex == 1 ? Text("Chats") : Text("Settings")),
        ),
        body: _selectedIndex == 1 ? ChatsPage() : SettingsPage(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble,
                color: Colors.grey,
              ),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}