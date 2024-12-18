import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// screens
import 'package:flutter_chat_app/screens/auth.dart';
import 'package:flutter_chat_app/screens/chat.dart';
import 'package:flutter_chat_app/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      // brightness: MediaQuery.platformBrightnessOf(context),
      brightness: Brightness.light,
      seedColor: Colors.blue,
    );

    final theme = ThemeData(
      colorScheme: colorScheme,
      cardTheme: CardTheme(
        color: colorScheme.surfaceContainer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            colorScheme.primaryContainer,
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.error,
        contentTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(colorScheme.primary),
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          if (snapshot.hasData) {
            return const ChatScreen();
          }

          return const AuthScreen();
        },
      ),
    );
  }
}
