import 'package:flutter/material.dart';

import 'package:message_undemy_app/screens/auth.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static ThemeData theme = ThemeData().copyWith(
      colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF3F11B1),
  ));

  static ThemeData theme2 = ThemeData(
      colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 63, 17, 177),
  ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const AuthScreen(),
    );
  }
}
