// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'playfire_logic.dart';

import 'alphabet_grid_widget.dart';
import 'widgets/key_input_widget.dart';
import 'widgets/value_input_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController keyTextController = TextEditingController();
  TextEditingController valueTextController = TextEditingController();
  String? alphabet;
  String wynik = 'Wynik';
  bool isEncrypting = true;

  @override
  void dispose() {
    keyTextController.dispose();
    valueTextController.dispose();
    super.dispose();
  }

  void alphabetGridEdit(String key) {
    setState(() {
      alphabet = alphabetStringFromKey(key);
    });
  }

  void encrypt(String key) {
    String result = playFireEncription(valueTextController.text, keyTextController.text);
    setState(() {
      wynik = result;
    });
  }

  void decrypt(String key) {
    String result = playFireDecription(valueTextController.text, keyTextController.text);
    setState(() {
      wynik = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: AlphabetGrid(alphabetString: alphabet),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          isEncrypting = true;
                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: isEncrypting ? Colors.green : Colors.grey,
                          child: Center(
                            child: Icon(Icons.lock_outline, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          isEncrypting = false;
                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: isEncrypting ? Colors.grey : Colors.green,
                          child: Center(
                            child: Icon(
                              Icons.lock_open,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child:
                    KeyInput(keyTextController: keyTextController, alphabetGridEdit: alphabetGridEdit),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ValueInput(
                    keyTextController: valueTextController, function: isEncrypting ? encrypt : decrypt),
              ),
            ),
            Expanded(
              flex: 1,
              child: SelectableText(
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 30),
                wynik,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
