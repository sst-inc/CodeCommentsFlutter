import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

var theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff1A3057), brightness: Brightness.light),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff1A3057), brightness: Brightness.dark),
);

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

  var chatsPage = SafeArea(
    child: Column(
      children: [
        ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) => Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                    title: Row(
                  children: [
                    Image.network(
                      "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
                      height: 60,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Wavin Wagpal $index",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "last message sent",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ],
                ))),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  color: Colors.black,
                ),
            itemCount: 5)
      ],
    ),
  );

  var settingsPage = SafeArea(
    child: Column(
      children: [
        ClipRRect(
            child: Image.network(
          "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
          height: 150,
        ))
      ],
    ),
  );

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
        body: _selectedIndex == 1 ? chatsPage : settingsPage,
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
