import 'package:flutter/material.dart';

class AboutMyApp extends StatelessWidget {
  const AboutMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('O aplikacji'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'To jest świetna aplikacja do sterowania samochodem. Jest stworzona na potrzeby laboratoriunm z elektroniki praktycznej.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const Text(''),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Stworzone przez: Aleksy Malawski przy pomocy fluttera ',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.favorite, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
