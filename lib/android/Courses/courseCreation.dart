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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter course name",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter course description",
                    border: OutlineInputBorder(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
