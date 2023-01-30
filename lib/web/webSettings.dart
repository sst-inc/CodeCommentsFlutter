import 'package:code_comments_flutter/web/WebEntryPoint.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebSettings extends StatefulWidget {
  WebSettings({super.key, this.openInEditMode = false});
  bool openInEditMode = false;

  @override
  State<WebSettings> createState() => _WebSettingsState();
}

class _WebSettingsState extends State<WebSettings> {
  // bool enteredEditMode = false;

  String name = "Wavin Wagpal";
  String email = "person@gmail.com";
  String occupation = "Programmer";
  String bio = "never gonna give you up";

  // TODO: allow this to be a list instead of a String
  String taughtLangs = "Py";

  String _tempBio = "";
  String _tempTaughtLangs = "";
  bool _modifiedBio = false;
  bool _modifiedTempLangs = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20, right: 40, left: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.network(
                          "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
                          height: 250,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var navigator = Navigator.of(context);
                          await FirebaseAuth.instance.signOut();
                          print("signed out");
                          navigator.pushReplacement(CupertinoPageRoute(
                            builder: (context) => WebApp(isLoggedIn: false),
                          ));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Log Out",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              VerticalDivider(
                thickness: 4,
                color: Colors.grey,
              ),
              !widget.openInEditMode
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Email: ${email}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              bio,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Occupation: ${occupation} who teaches ${taughtLangs}",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ])
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: TextFormField(
                            initialValue: taughtLangs,
                            onChanged: (value) {
                              _tempTaughtLangs = value;
                              _modifiedTempLangs = true;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Taught Languages",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: TextFormField(
                            initialValue: bio,
                            onChanged: (value) {
                              _tempBio = value;
                              _modifiedBio = true;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Bio",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: TextFormField(
                            enabled: false,
                            initialValue: name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Name",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: TextFormField(
                            enabled: false,
                            initialValue: email,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Email",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: TextFormField(
                            enabled: false,
                            initialValue: occupation,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Occupation",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
