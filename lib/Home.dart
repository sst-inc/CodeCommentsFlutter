import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';

import 'messages.dart';

var brightness = SchedulerBinding.instance.window.platformBrightness;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Text(
            "Calendar view",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 150,
          ),
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) => InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        title: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
                                height: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Wavin Wagpal $index",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "last message sent",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      var navigator = Navigator.of(context);
                      navigator.push(MaterialPageRoute(
                          builder: (context) => ChatsInterface()));
                    },
                  ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    color: Colors.black,
                  ),
              itemCount: 3),
        ],
      ),
    ));
  }
}
