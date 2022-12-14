import 'package:code_comments_flutter/themes.dart';
import 'package:flutter/material.dart';

class AddEventsView extends StatefulWidget {
  const AddEventsView({super.key});

  @override
  State<AddEventsView> createState() => _AddEventsViewState();
}

class _AddEventsViewState extends State<AddEventsView> {
  bool repeats = false;
  bool allDay = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(hintText: "Add title"),
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Pick date",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Pick time",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    "Repeats",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Switch(
                    value: repeats,
                    activeColor: darkTheme(context).selectedRowColor,
                    onChanged: (bool value) {
                      setState(() {
                        repeats = value;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    "All day",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Switch(
                    value: allDay,
                    activeColor: darkTheme(context).selectedRowColor,
                    onChanged: (bool value) {
                      setState(() {
                        allDay = value;
                      });
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
