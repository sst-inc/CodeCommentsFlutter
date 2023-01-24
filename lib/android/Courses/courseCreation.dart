import 'package:flutter/material.dart';

class CourseCreation extends StatefulWidget {
  const CourseCreation({super.key});

  @override
  State<CourseCreation> createState() => _CourseCreationState();
}

class _CourseCreationState extends State<CourseCreation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          size: 90,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Text(
                                "Upload cover image",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 50,
                            width: 720,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter course name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 50,
                                width: 500,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter course coding language",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter course limit",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 100,
                            width: 720,
                            child: TextField(
                              minLines: 3,
                              maxLines: 6,
                              decoration: InputDecoration(
                                hintText: "Enter course description",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                              child: Text(
                                "Create",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
