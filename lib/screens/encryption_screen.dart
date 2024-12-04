import 'package:flutter/material.dart';

import 'package:flutter_master/main.dart';
import 'package:flutter_master/widgets/my_button.dart';
import 'package:flutter_master/widgets/my_text_field.dart';

import 'package:flutter_master/models/logic.dart';

class EncryptionScreen extends StatefulWidget {
  const EncryptionScreen({super.key});

  @override
  State<EncryptionScreen> createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  TextEditingController pController = TextEditingController();
  TextEditingController qController = TextEditingController();
  TextEditingController textController = TextEditingController();

  RsaObject rsa = RsaObject(text: '');

  bool isNumeric(String s) {
    return double.parse(s) != null;
  }

  void onPressedGenerateRandom() {
    rsa.generateNewPrime();
    pController.text = rsa.p.toString();
    qController.text = rsa.q.toString();
    generateKeys();
    setState(() {});
  }

  void generateKeys() {
    if ((rsa.p != null) && rsa.q != null) {
      if (isPrime(rsa.p!) && isPrime(rsa.q!)) {
        rsa.generateKeys();
        setState(() {});
      }
    }
  }

  void onchangedp(String text) {
    rsa.p = int.parse(text);
    generateKeys();
  }

  void onchangedq(String text) {
    rsa.q = int.parse(text);
    print("lol");
    generateKeys();
  }

  void enryptText(String text) {
    rsa.text = text;
    rsa.encrypt();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: const Text("RSA Encryption"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyTextField(
                          labelText: 'Enter p',
                          controller: pController,
                          onChangedfunc: onchangedp,
                        ),
                        const SizedBox(height: 20),
                        MyTextField(
                          labelText: 'Enter q',
                          controller: qController,
                          onChangedfunc: onchangedq,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 300,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceDim,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.key),
                                  SizedBox(width: 8),
                                  SingleChildScrollView(
                                      child: Text(rsa.publickey == null
                                          ? 'public key will show here'
                                          : rsa.publickey.toString())),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.key_off),
                                  SizedBox(width: 8),
                                  Text(rsa.privateKey == null
                                      ? 'private key will show here'
                                      : rsa.privateKey.toString())
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyTextField(
                          labelText: "Insert text to encrypt",
                          controller: textController,
                        ),
                        const SizedBox(height: 46),
                        MyButton(
                            text: "Generate random prime numbers",
                            icon: Icons.shuffle,
                            onPressed: onPressedGenerateRandom),
                        const SizedBox(height: 20),
                        MyButton(
                          text: "Encrypt",
                          icon: Icons.add_circle_outline,
                          onPressed: () {
                            enryptText(textController.text);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                width: 600 + MediaQuery.of(context).size.width * 0.05,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceDim,
                  // border: Border.all(color: Colors.black.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SelectableText(rsa.encryptedListCodeUnits.isEmpty
                    ? "Encrypted text will show here"
                    : rsa.encryptedListCodeUnits.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
