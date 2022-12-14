import 'package:code_comments_flutter/Login/login.dart';
import 'package:code_comments_flutter/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DevMenu extends StatefulWidget {
  const DevMenu({super.key});

  @override
  State<DevMenu> createState() => _DevMenuState();
}

class _DevMenuState extends State<DevMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: Scaffold(
        appBar: AppBar(title: Text("Developer menu")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Use the menu to access different parts of the app which are still in development",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      var navigator = Navigator.of(context);
                      navigator.push(CupertinoPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text("Login screen"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
