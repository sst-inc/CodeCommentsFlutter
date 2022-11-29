import 'package:code_comments_flutter/messages.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
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
                                height: 60,
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
              itemCount: 5)
        ],
      ),
    );
    ;
  }
}
