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
    String value = valueTextController.text;
    String result = playFireEncription(valueTextController.text, keyTextController.text);
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
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: AlphabetGrid(alphabetString: alphabet),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child:
                    KeyInput(keyTextController: keyTextController, alphabetGridEdit: alphabetGridEdit),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ValueInput(keyTextController: valueTextController, encrypt: encrypt),
              ),
            ),
            Expanded(
              flex: 1,
              child: SelectableText(
                wynik,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
