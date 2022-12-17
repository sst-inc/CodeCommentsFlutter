import 'package:code_comments_flutter/android/Login/register.dart';
import 'package:code_comments_flutter/android/Miscellaneous/themes.dart';
import 'package:code_comments_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          actions: [
            TextButton(
              onPressed: () {
                var navigator = Navigator.of(context);
                navigator.push(CupertinoPageRoute(
                  builder: (context) => RegisterView(),
                ));
              },
              child: Text(
                "Register",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Log in to CodeComments",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Username",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    var navigator = Navigator.of(context);
                    navigator.push(
                        CupertinoPageRoute(builder: ((context) => MyApp())));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 140,
                      ),
                      Text("Log In"),
                      SizedBox(
                        width: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
