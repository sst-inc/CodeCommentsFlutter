import 'package:code_comments_alter/themes.dart';
import 'package:flutter/material.dart';

class ChatsInterface extends StatefulWidget {
  const ChatsInterface({super.key});

  @override
  State<ChatsInterface> createState() => _ChatsInterfaceState();
}

class _ChatsInterfaceState extends State<ChatsInterface> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
            title: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWsfakMpS0_MBEQWSK1zsZSK3nFqW2KhNnJYiySzQKLQ&s",
                  height: 40,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text("Wavin Wagpal"),
            ],
          ),
        )),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                color: darkTheme.primaryColorDark,
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
          ],
        ),
      ),
    );
  }
}
