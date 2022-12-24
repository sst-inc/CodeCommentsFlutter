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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20, right: 40, left: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(
                      "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
                      height: 250,
                    ),
                  ),
                ),
              ),
              !widget.openInEditMode
                  ? Column(children: [
                      // TODO: find a better way to display all of these without looking ugly
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Welcome, ${name}",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "${email}",
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
                          "${occupation} who teaches ${taughtLangs}",
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
