import 'package:code_comments_flutter/Messaging/chatDisplayModel.dart';
import 'package:code_comments_flutter/Messaging/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var conversations = [
  ChatDisplayView(
    lastMessage: messages.last.messageContent,
    senderName: "Wavin Wagpal",
    senderPfpUrl:
        "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
  ),
  ChatDisplayView(
    lastMessage: messages.last.messageContent,
    senderName: "Nikhil Nallani",
    senderPfpUrl:
        "https://play-lh.googleusercontent.com/8ddL1kuoNUB5vUvgDVjYY3_6HwQcrg1K2fd_R8soD-e2QYj8fT9cfhfh3G0hnSruLKec",
  ),
  ChatDisplayView(
    lastMessage: messages.last.messageContent,
    senderName: "Kottaimuthu Shrinithi",
    senderPfpUrl:
        "https://wompampsupport.azureedge.net/fetchimage?siteId=7575&v=2&jpgQuality=100&width=700&url=https%3A%2F%2Fi.kym-cdn.com%2Fentries%2Ficons%2Fmedium%2F000%2F037%2F349%2FScreenshot_14.jpg",
  ),
  ChatDisplayView(
    lastMessage: messages.last.messageContent,
    senderName: "Sairam Suresh",
    senderPfpUrl:
        "https://i.scdn.co/image/ab6761610000e5ebe1408498d7f528e3671616b1",
  )
];

class ChatsPage extends StatefulWidget {
  ChatsPage({super.key, required this.outerScaffoldKey});
  GlobalKey<ScaffoldState> outerScaffoldKey;

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Chats"),
          centerTitle: false,
          leading: MaterialButton(
            onPressed: () {
              widget.outerScaffoldKey.currentState!.openDrawer();
            },
            child: Icon(Icons.menu),
          )),
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
                                            navigator.push(
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    ChatsInterface(
                                                  nameOfPerson:
                                                      conversations[index]
                                                          .senderName,
                                                  pfpImageUrl:
                                                      conversations[index]
                                                          .senderPfpUrl,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Container(),
                                    itemCount: conversations.length)
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
                          navigator.push(
                            CupertinoPageRoute(
                              builder: (context) => ChatsInterface(
                                nameOfPerson: conversations[index].senderName,
                                pfpImageUrl: conversations[index].senderPfpUrl,
                              ),
                            ),
                          );
                        },
                      ),
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(),
                  itemCount: conversations.length)
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
