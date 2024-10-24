import 'package:flutter/material.dart';
import 'package:flutter_master/left_panel.dart';
import 'package:flutter_master/vigenere_logic.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static Color top = Colors.white;
  static Color left = const Color(0xff56d0ff);
  static Color rightTop = const Color(0xff5cc397);
  static Color rightBottom = Colors.grey;
  static Color reset = const Color.fromARGB(255, 241, 89, 66);
  static Color bottom = const Color(0xffffd025);
  static BorderRadiusGeometry myRadious = const BorderRadius.all(Radius.circular(30));

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool encryption = true;
  double myPadding = 5;

  final outputText = TextEditingController(text: 'tu pojawi się tekst');
  final textController = TextEditingController();
  final kluczController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    kluczController.dispose();
    outputText.dispose();
    super.dispose();
  }

  void greenButtonPressed() {
    setState(() {
      if (encryption) {
        outputText.text = encrypt(textController.text, kluczController.text);
      } else {
        outputText.text = deencrypt(textController.text, kluczController.text);
      }
    });
  }

  void clearScreen() {
    textController.clear();
    kluczController.clear();
    outputText.text = 'tu pojawi się tekst';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'szfr Vigenère’a',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          centerTitle: true,
          backgroundColor: MainApp.top,
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
                    child: MyLeftPanel(
                      myPadding: myPadding,
                      accept: MainApp.rightTop,
                      left: MainApp.left,
                      myRadious: MainApp.myRadious,
                      reset: MainApp.reset,
                      textController: textController,
                      kluczController: kluczController,
                      outputText: outputText,
                      greenButtonPressed: greenButtonPressed,
                      clearScreen: clearScreen,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: encryption ? 2 : 1,
                          child: Padding(
                            padding: EdgeInsets.only(right: myPadding, top: myPadding, left: myPadding),
                            child: ClipRRect(
                              borderRadius: MainApp.myRadious,
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: Material(
                                  color: encryption ? MainApp.rightTop : MainApp.rightBottom,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        encryption = true;
                                      });
                                    },
                                    child: const Icon(Icons.enhanced_encryption,
                                        size: 100, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: encryption ? 1 : 2,
                          child: Padding(
                            padding: EdgeInsets.all(myPadding),
                            child: ClipRRect(
                              borderRadius: MainApp.myRadious,
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: Material(
                                  color: !encryption ? MainApp.rightTop : MainApp.rightBottom,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        encryption = false;
                                      });
                                    },
                                    child:
                                        const Icon(Icons.no_encryption, size: 100, color: Colors.black),
                                  ),
                                ),
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
                padding: EdgeInsets.only(left: myPadding, bottom: myPadding, right: myPadding),
                child: ClipRRect(
                  borderRadius: MainApp.myRadious,
                  child: Container(
                    color: MainApp.bottom,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SelectableText(
                            outputText.text,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 20, height: 1.2),
                          ),
                        ),
                      ),
                    ),
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
