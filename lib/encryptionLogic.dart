import 'dart:math';

import 'package:flutter_master/key.dart';

String text = "ala 123123ma kot 1!@#!@#  ///";
String stringInAlphabet = "aąbcćdeęfghijklłmnńoóprsśtuwyzźż";

double encrypt(String text, double a, double b) {
  String tableString = "";
  text = text.toLowerCase();
  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    if (stringInAlphabet.contains(char)) {
      tableString += alphabetPl.entries.firstWhere((element) => element.value == char).key.toString();
    }
  }
  double y = double.parse(tableString);
  return (sqrt(y) - b / a) / 1000;
}

String decrypt(double y, int a, int b) {
  String decryptedText = "";
  y = y * 1000;
  y = y + b / a;
  y = pow(y, 2).toDouble();
  String tableString = (y).round().toString().replaceAll(".0", "");
  print("tableString");
  print(tableString);
  for (int i = 0; i < tableString.length; i += 2) {
    int char = int.parse(tableString[i] + tableString[i + 1]);
    decryptedText += alphabetPl[char]!;
  }

  return decryptedText;
}

void main() {
  print(encrypt(text, 2, 3));
  print(decrypt(encrypt(text, 2, 3), 2, 3));
}
