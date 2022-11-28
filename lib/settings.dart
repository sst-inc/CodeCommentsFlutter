import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
                  height: 300,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Text(
              "Username: (null)",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Email: (null)",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Bio: (null)",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Occupation: (null)",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Coding Language: (null)",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    ));
    ;
  }
}
