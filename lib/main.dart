import 'dart:io' show Platform;

import 'package:code_comments_flutter/macos/MacOSEntryPoint.dart';
import 'package:code_comments_flutter/web/WebEntryPoint.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'android/AndroidEntryPoint.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

var isLoggedIn = false;

void main() async {
  final prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      print(user.uid);
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return WebApp(
        isLoggedIn: isLoggedIn,
      ); // The app is running on web
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
