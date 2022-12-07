import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20),
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
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Username: (null)",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Email: (null)",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Bio: (null)",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Occupation: (null)",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Coding Language: (null)",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Edit details",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    ));
  }
}
