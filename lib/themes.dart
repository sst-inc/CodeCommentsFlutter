import 'package:flutter/material.dart';

var theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff1A3057), brightness: Brightness.light),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff1A3057), brightness: Brightness.dark),
);