import 'package:flutter/material.dart';

class schedulingView extends StatefulWidget {
  const schedulingView({super.key});

  @override
  State<schedulingView> createState() => _schedulingViewState();
}

class _schedulingViewState extends State<schedulingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scheduling")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Calendar view",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
