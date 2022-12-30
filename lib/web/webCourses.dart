import 'package:code_comments_flutter/web/webHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../android/Courses/coursedetails.dart';

class webCourses extends StatefulWidget {
  const webCourses({super.key});

  @override
  State<webCourses> createState() => _webCoursesState();
}

class _webCoursesState extends State<webCourses> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width - 200) / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Enrolled courses",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                            child: Card(child: buildCourseObject(index)),
                            onTap: () {
                              var navigator = Navigator.of(context);
                              navigator.push(CupertinoPageRoute(
                                  builder: (context) => CoursePage()));
                            },
                          ),
                      itemCount: 4)
                ],
              ),
            ),
            VerticalDivider(
              thickness: 4,
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 200) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Your courses",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                            child: Card(child: buildCourseObject(index)),
                            onTap: () {
                              var navigator = Navigator.of(context);
                              navigator.push(CupertinoPageRoute(
                                  builder: (context) => CoursePage()));
                            },
                          ),
                      itemCount: 4),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 180,
                            ),
                            Icon(Icons.add),
                            Text(
                              " Create new course",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCourseObject(int index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: Row(
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      "https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png",
                      height: 30,
                      width: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(padding: EdgeInsets.zero, child: Container()),
            ),
            Flexible(
              flex: 20,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Course $index",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "this is some text",
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
