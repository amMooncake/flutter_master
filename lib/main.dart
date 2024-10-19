import 'package:flutter/material.dart';

import 'vigenere_logic.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static Color top = Colors.white;
  static Color left = Color(0xff9FC131);
  static Color right = Color(0xff005C53);
  static Color bottom = Color(0xffD6D58E);
  static EdgeInsetsGeometry myPadding = EdgeInsets.all(10);
  static BorderRadiusGeometry myRadious = BorderRadius.all(Radius.circular(30));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          centerTitle: true,
          backgroundColor: top,
          title: Text("Szyfr Vigenère’a",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 40)),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: ClipRRect(
                          borderRadius: myRadious,
                          child: Container(
                            height: double.infinity,
                            color: left,
                            child: const Padding(
                              padding: EdgeInsets.all(20),
                              child: Text("data"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: myRadious,
                                child: Container(
                                  color: right,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                              child: ClipRRect(
                                borderRadius: myRadious,
                                child: Container(
                                  color: right,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: myRadious,
                    child: Container(
                      color: bottom,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
