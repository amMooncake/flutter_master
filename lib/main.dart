import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_master/screens/encryption_screen.dart';

void main() {
  runApp(const MyApp());
}

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: Colors.blue,
);

final theme = ThemeData().copyWith(
  colorScheme: colorScheme,
  iconTheme: const IconThemeData(
    size: 35.0,
  ),
  textTheme: GoogleFonts.robotoCondensedTextTheme().copyWith(
    bodyLarge: GoogleFonts.roboto(
      fontSize: 20.0,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 20.0,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 20.0,
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RSA Encryption',
      theme: theme,
      home: const EncryptionScreen(),
    );
  }
}
