import 'dart:io' show Platform;

import 'package:code_comments_flutter/macos/MacOSEntryPoint.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'android/AndroidEntryPoint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return MaterialApp(); // The app is running on web
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        return AndroidApp();
      } else if (Platform.isMacOS) {
        return MacOSApp();
      } else {
        return MaterialApp();
      }
    }
  }
}
