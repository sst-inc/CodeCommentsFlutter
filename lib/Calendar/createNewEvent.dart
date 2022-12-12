import 'package:flutter/material.dart';

class CreateNewCalendarEvent extends StatefulWidget {
  const CreateNewCalendarEvent({Key? key}) : super(key: key);

  @override
  State<CreateNewCalendarEvent> createState() => _CreateNewCalendarEventState();
}

class _CreateNewCalendarEventState extends State<CreateNewCalendarEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Calendar Event"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.5,
      ),
    );
    ;
  }
}
