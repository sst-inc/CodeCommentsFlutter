import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedIconTheme: IconThemeData(color: Colors.grey)),
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1A3057), brightness: Brightness.light),
      textTheme: Theme.of(context)
          .textTheme
          .apply(displayColor: Colors.black, bodyColor: Colors.black));
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedLabelStyle: TextStyle(color: Colors.white),
          selectedLabelStyle: TextStyle(color: Colors.white),
          selectedIconTheme: IconThemeData(color: Colors.grey),
          unselectedIconTheme: IconThemeData(color: Colors.grey)),
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1A3057), brightness: Brightness.dark),
      textTheme: Theme.of(context)
          .textTheme
          .apply(displayColor: Colors.white, bodyColor: Colors.white));
}
