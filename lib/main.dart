import 'package:flutter/material.dart';
import 'package:flutter_master/encryption.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ),
      home: const MyEncryption(),
      debugShowCheckedModeBanner: false,
    );
  }
}
