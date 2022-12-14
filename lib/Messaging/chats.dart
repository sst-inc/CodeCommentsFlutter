import 'package:code_comments_flutter/Messaging/chatDisplayModel.dart';
import 'package:code_comments_flutter/Messaging/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Miscellaneous/HamburgerMenu.dart';
var conversations = [
  ChatDisplayView(
    lastMessage: "Amogus",
    senderName: "Wavin Wagpal",
    senderPfpUrl:
        "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
  ),
  ChatDisplayView(
    lastMessage: "Hee hee hee haw",
    senderName: "Nikhil Nallani",
    senderPfpUrl:
        "https://play-lh.googleusercontent.com/8ddL1kuoNUB5vUvgDVjYY3_6HwQcrg1K2fd_R8soD-e2QYj8fT9cfhfh3G0hnSruLKec",
  )
];

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerActions(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0))),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Search for users"),
                    ),
                    body: SafeArea(
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Type in search parameters"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (BuildContext context,
                                            int index) =>
                                        InkWell(
                                          child: Card(
                                              child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image.network(
                                                    conversations[index]
                                                        .senderPfpUrl,
                                                    height: 50,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  conversations[index]
                                                      .senderName,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          )),
                                          onTap: () {
                                            var navigator =
                                                Navigator.of(context);
                                            navigator.push(CupertinoPageRoute(
                                                builder: (context) =>
                                                    ChatsInterface()));
                                          },
                                        ),
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Container(),
                                    itemCount: 2)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.edit),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                        child: Card(child: chatsDataView(index)),
                        onTap: () {
                          var navigator = Navigator.of(context);
                          navigator.push(CupertinoPageRoute(
                              builder: (context) => ChatsInterface()));
                        },
                      ),
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(),
                  itemCount: 2)
            ],
          ),
        ),
      ),
    );
  }

  Widget chatsDataView(int index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: Row(
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    conversations[index].senderPfpUrl,
                    height: 50,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(padding: EdgeInsets.zero, child: Container()),
            ),
            Flexible(
              flex: 20,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conversations[index].senderName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      conversations[index].lastMessage,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
