import 'package:code_comments_flutter/android//Courses/coursedetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key, required this.outerScaffoldKey});
  final GlobalKey<ScaffoldState> outerScaffoldKey;

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int chosenTab = 0; // 0: User-made courses 1: Enrolled ones

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          floatingActionButton: chosenTab == 0
              ? FloatingActionButton.extended(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("Explore"))
              : FloatingActionButton.extended(
                  onPressed: () {}, label: Text("New"), icon: Icon(Icons.edit)),
          appBar: AppBar(
              title: Text("Currently Enrolled"),
              centerTitle: false,
              bottom: TabBar(
                  tabs: const [
                    Tab(
                      text: "Your Courses",
                    ),
                    Tab(
                      text: "Enrolled Courses",
                    )
                  ],
                  onTap: (value) {
                    setState(() {
                      chosenTab = value;
                    });
                  }),
              leading: MaterialButton(
                onPressed: () {
                  widget.outerScaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.menu),
              )),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              SafeArea(
                child: Padding(
                  // TODO: Rework this screen
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                                child: Card(child: buildCourseObject(index)),
                                onTap: () {
                                  var navigator = Navigator.of(context);
                                  navigator.push(CupertinoPageRoute(
                                      builder: (context) => CoursePage()));
                                },
                              ),
                          itemCount: 5)
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  // TODO: Rework this screen
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                                child: Card(child: buildCourseObject(index)),
                                onTap: () {
                                  var navigator = Navigator.of(context);
                                  navigator.push(CupertinoPageRoute(
                                      builder: (context) => CoursePage()));
                                },
                              ),
                          itemCount: 5)
                    ],
                  ),
                ),
              ),
            ],
          )),
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

  // Widget buildCourseObject(int index) {
  //   return Container(
  //     constraints: BoxConstraints(minHeight: 70),
  //     alignment: Alignment.centerLeft,
  //     child: Row(
  //       children: [
  //         Flexible(
  //           fit: FlexFit.tight,
  //           flex: 1,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(10),
  //             // TODO: Make this adapt to the image itself
  //             child: Image.network(
  //               "https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png",
  //               height: 30,
  //               width: 30,
  //             ),
  //           ),
  //         ),
  //         Flexible(
  //           fit: FlexFit.tight,
  //           flex: 5,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 ,
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(top: 5),
  //                 child:
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
