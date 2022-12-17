import 'package:flutter/material.dart';

class CreateNewCalendarEvent extends StatefulWidget {
  const CreateNewCalendarEvent({Key? key}) : super(key: key);

  @override
  State<CreateNewCalendarEvent> createState() => _CreateNewCalendarEventState();
}

class _CreateNewCalendarEventState extends State<CreateNewCalendarEvent> {
  String newCalendarEventName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Calendar Event"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                // TODO: Finish the rest of the functionality
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Calendar Event Name"),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Location or Video Call (if any)"),
                ),
              ],
            ),
          ),
        ));
  }
}
