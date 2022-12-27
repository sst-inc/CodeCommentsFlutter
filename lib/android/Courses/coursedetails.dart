import 'package:flutter/material.dart';

import '../Miscellaneous/themes.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Course details"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Course name",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        "https://raw.githubusercontent.com/flutter-rus/flutter-rus.github.io/master/images/logo.png",
                        height: 150,
                        width: 125,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "This is supposed to be the description of the thing-?",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Course materials",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: ListTile(
                              title: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Icon(Icons.description),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Item $index",
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
                          onTap: () {},
                        ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          color: Colors.black,
                        ),
                    itemCount: 3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
