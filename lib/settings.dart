import 'package:code_comments_flutter/Login/login.dart';
import 'package:code_comments_flutter/devmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Miscellaneous/HamburgerMenu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool enteredEditMode = false;

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Settings"), centerTitle: false),
        drawer: DrawerActions(),
        floatingActionButton: !enteredEditMode
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    enteredEditMode = !enteredEditMode;
                  });
                },
                enableFeedback: true,
                backgroundColor: Theme.of(context).primaryColor,
                child: !enteredEditMode
                    ? const Icon(Icons.edit)
                    : const Icon(Icons.check),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        setState(() {
                          _tempBio = "";
                          _tempTaughtLangs = "";
                          _modifiedBio = false;
                          _modifiedTempLangs = false;
                          enteredEditMode = !enteredEditMode;
                        });
                      },
                      enableFeedback: true,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(Icons.cancel_outlined),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (_modifiedBio) {
                          bio = _tempBio;
                        } else {
                          bio = bio;
                        }
                        if (_modifiedTempLangs) {
                          taughtLangs = _tempTaughtLangs;
                        } else {
                          taughtLangs = taughtLangs;
                        }
                        _tempBio = "";
                        _tempTaughtLangs = "";
                        _modifiedBio = false;
                        _modifiedTempLangs = false;
                        enteredEditMode = !enteredEditMode;
                      });
                    },
                    enableFeedback: true,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(Icons.check),
                  )
                ],
              ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: Image.network(
                          "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
                          height: 250,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  !enteredEditMode
                      ? Column(children: [
                          // TODO: find a better way to display all of these without looking ugly
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Welcome, $name",
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              email,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              bio,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "$occupation who teaches $taughtLangs",
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ])
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextFormField(
                                initialValue: taughtLangs,
                                onChanged: (value) {
                                  _tempTaughtLangs = value;
                                  _modifiedTempLangs = true;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Taught Languages",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextFormField(
                                initialValue: bio,
                                onChanged: (value) {
                                  _tempBio = value;
                                  _modifiedBio = true;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Bio",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextFormField(
                                enabled: false,
                                initialValue: name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Name",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextFormField(
                                enabled: false,
                                initialValue: email,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Email",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: TextFormField(
                                enabled: false,
                                initialValue: occupation,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Occupation",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always),
                              ),
                            ),
                          ],
                        ),
                  ElevatedButton(
                    onPressed: () {
                      var navigator = Navigator.of(context);
                      navigator.push(CupertinoPageRoute(
                          builder: (context) => const DevMenu()));
                    },
                    child: const Text(
                      "Show dev menu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var navigator = Navigator.of(context);
                      navigator.push(CupertinoPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
