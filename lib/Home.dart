import 'package:flutter/scheduler.dart';

import 'themes.dart';
import 'package:flutter/material.dart';

import 'chats.dart';
import 'settings.dart';

var brightness = SchedulerBinding.instance.window.platformBrightness;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
