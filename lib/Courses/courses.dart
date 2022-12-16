import 'package:code_comments_flutter/Courses/coursedetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Miscellaneous/HamburgerMenu.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
        centerTitle: false,
      ),
      drawer: DrawerActions(),
      body: SafeArea(
        child: Padding(
          // TODO: Rework this screen
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Currently enrolled",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            title: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png",
                                    height: 50,
                                    width: 30,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Course $index",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "this is some text",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          var navigator = Navigator.of(context);
                          navigator.push(CupertinoPageRoute(
                              builder: (context) => CoursePage()));
                        },
                      ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        color: Colors.black,
                      ),
                  itemCount: 5)
            ],
          ),
        ),
      ),
    );
  }
}
