import 'package:flutter/material.dart';
import '../android/Messaging/chatMessageModel.dart';
import '../android/Messaging/chats.dart';
import 'package:flutter/cupertino.dart';
import '../android/Messaging/messages.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent: "Never gonna give you up", messageType: "receiver"),
  ChatMessage(
      messageContent: "Never gonna let you down", messageType: "receiver"),
  ChatMessage(
      messageContent: "Never gonna run around and desert you",
      messageType: "sender"),
  ChatMessage(
      messageContent: "Never gonna make you cry", messageType: "receiver"),
  ChatMessage(messageContent: "Never gonna say goodbye", messageType: "sender"),
];

class _ChatsPageState extends State<ChatsPage> {
  var nameOfPerson = "";
  var pfpImageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 100,
                child: ListView.separated(
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
                                  pfpImageUrl:
                                      conversations[index].senderPfpUrl,
                                ),
                              ),
                            );
                          },
                        ),
                    separatorBuilder: (BuildContext context, int index) =>
                        Container(),
                    itemCount: conversations.length),
              )
            ],
          ),
          Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        pfpImageUrl,
                        height: 40,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(nameOfPerson),
                  ],
                ),
              ),
            ),
            body: SizedBox(
              width: 100,
              child: Row(
                children: [
                  Stack(
                    children: <Widget>[
                      ListView.builder(
                        itemCount: messages.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment:
                                  (messages[index].messageType == "receiver"
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      (messages[index].messageType == "receiver"
                                          ? Colors.grey.shade800
                                          : Colors.blue[500]),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  messages[index].messageContent,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Column(
                        children: [
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10),
                              height: 60,
                              // color: darkTheme.primaryColorDark,
                              width: double.infinity,
                              child: Row(
                                children: <Widget>[
                                  ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                      label: Text("Add")),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Write message...",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.send),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chatsDataView(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
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
