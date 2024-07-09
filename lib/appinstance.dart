import 'package:flutter/material.dart';
import 'package:benjamin/core/managers/singleton_manager/imanagers.dart';

class AppInstance extends StatefulWidget {
  const AppInstance._internal();
  static AppInstance instance = const AppInstance._internal();
  const AppInstance({super.key});

  @override
  State<AppInstance> createState() => _AppInstanceState();
}

class _AppInstanceState extends State<AppInstance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Imanagers.theme.lightMode,
      darkTheme: Imanagers.theme.darkMode,
      themeMode: ThemeMode.system,
      home: Imanagers.benjamin,
      debugShowCheckedModeBanner: false,
    );
  }
}
