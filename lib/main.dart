import 'dart:io' show Platform;

import 'package:code_comments_flutter/web/webEntryPoint.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'android/AndroidEntryPoint.dart';
import 'macos/MacOSEntryPoint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return WebApp(); // The app is running on web
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        return const AndroidApp();
      } else if (Platform.isMacOS) {
        return const MacOSApp();
      } else {
        return const MaterialApp();
      }
    }
  }
}
