import 'package:code_comments_flutter/web/webScheduling.dart';
import 'package:flutter/material.dart';
import 'package:code_comments_flutter/android//Messaging/chatDisplayModel.dart';
import 'package:code_comments_flutter/android//Messaging/messages.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            webCalendar(),
            SizedBox(
              width: 30,
            ),
            VerticalDivider(
              thickness: 4,
            ),
            SizedBox(
              width: 30,
            ),
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
                                    nameOfPerson:
                                        conversations[index].senderName,
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
            )
          ],
        ),
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
