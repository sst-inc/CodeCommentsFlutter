import 'package:flutter/material.dart';

class DrawerActions extends StatefulWidget {
  final Function(int, bool)? onEditButtonPressed;
  const DrawerActions({Key? key, this.onEditButtonPressed}) : super(key: key);

  @override
  State<DrawerActions> createState() => _DrawerActionsState();
}

class _DrawerActionsState extends State<DrawerActions> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            padding: EdgeInsets.all(10),
            child: Center(
              child: Stack(children: [
                Row(
                  children: [
                    ProfilePic(),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ravin Nagpal"),
                          Text("I like kids"),
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (widget.onEditButtonPressed != null) {
                          widget.onEditButtonPressed!(4, true);
                        }
                        DefaultTabController.of(context)!.animateTo(4);
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.edit),
                      mini: true,
                    ))
              ]),
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget ProfilePic() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Image.network(
        "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
        height: MediaQuery.of(context).size.height / 8,
      ),
    );
  }
}
