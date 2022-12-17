import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class MacOSApp extends StatefulWidget {
  const MacOSApp({Key? key}) : super(key: key);

  @override
  State<MacOSApp> createState() => _MacOSAppState();
}

class _MacOSAppState extends State<MacOSApp> {
  @override
  Widget build(BuildContext context) {
    return MacosApp(
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
