import 'package:flutter/material.dart';
import 'package:flutter_master/left_panel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static Color top = Colors.white;
  static Color left = const Color(0xff56d0ff);
  static Color rightTop = const Color(0xff5cc397);
  static Color rightBottom = Colors.grey;
  static Color reset = const Color(0xfffe8042);
  static Color bottom = const Color(0xffffd025);
  static EdgeInsetsGeometry myPadding = const EdgeInsets.all(10);
  static BorderRadiusGeometry myRadious = const BorderRadius.all(Radius.circular(30));

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
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MyLeftPanel(accept: rightTop, left: left, myRadious: myRadious, reset: reset),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: myRadious,
                              child: Container(
                                color: rightTop,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: myRadious,
                              child: Container(
                                color: rightBottom,
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
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
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
      debugShowCheckedModeBanner: false,
    );
  }
}
