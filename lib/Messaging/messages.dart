import 'package:code_comments_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'chatMessageModel.dart';

class ChatsInterface extends StatefulWidget {
  ChatsInterface(
      {required this.nameOfPerson, required this.pfpImageUrl, super.key});
  String nameOfPerson;
  String pfpImageUrl;
  @override
  State<ChatsInterface> createState() => _ChatsInterfaceState();
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

class _ChatsInterfaceState extends State<ChatsInterface> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.pfpImageUrl,
                    height: 40,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(widget.nameOfPerson),
              ],
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType == "receiver"
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
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
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
      ),
    );
  }
}
