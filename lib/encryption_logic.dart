// import 'dart:math';
// import 'package:flutter_master/key.dart';

String text = "ala 123123ma kot 1!@#!@#  ///";
String stringInAlphabet = "aąbcćdeęfghijklłmnńoóprsśtuwyzźż";

String encrypt(String text, int a, int b, Map<int, String> alphabet) {
  String tableString = "";
  text = text.toLowerCase();
  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    if (stringInAlphabet.contains(char)) {
      tableString += alphabet.entries.firstWhere((element) => element.value == char).key.toString();
    }
  }

  String encryptedString = '';

  for (int i = 0; i < tableString.length; i += 2) {
    int char = int.parse(tableString[i] + tableString[i + 1]);
    if (i / 2 % 2 == 0) {
      encryptedString += ((char + a) % 100).toString();
    } else {
      encryptedString += ((char + b) % 100).toString();
    }
  }

  return encryptedString;
}

String decrypt(String tableString, int a, int b, Map<int, String> alphabet) {
  String decryptedText = "";

  for (int i = 0; i < tableString.length; i += 2) {
    int char = int.parse(tableString[i] + tableString[i + 1]);
    if (i / 2 % 2 == 0) {
      while (char - a < 0) {
        char += 100;
      }
      decryptedText += alphabet[(char - a)]!;
    } else {
      while (char - b < 0) {
        char += 100;
      }
      decryptedText += alphabet[(char - b)]!;
    }
  }

  return decryptedText;
}

void main() {
  // print(encrypt(text, 2, 3));
  // print(decrypt(encrypt(text, 2, 3), 2, 3));
}
