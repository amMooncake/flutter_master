import 'package:flutter/material.dart';

import 'package:flutter_master/main.dart';
import 'package:flutter_master/widgets/my_button.dart';
import 'package:flutter_master/widgets/my_text_field.dart';

import 'package:flutter_master/models/logic.dart';

class DecryptionScreen extends StatefulWidget {
  const DecryptionScreen({super.key, required this.rsa});
  final RsaObject rsa;

  @override
  State<DecryptionScreen> createState() => _DecryptionScreenState();
}

class _DecryptionScreenState extends State<DecryptionScreen> {
  TextEditingController pController = TextEditingController();
  TextEditingController qController = TextEditingController();
  TextEditingController textController = TextEditingController();

  RsaObject rsa = RsaObject(text: '');
  String privateKey = '';
  String publicKey = '';

  @override
  void dispose() {
    // Dispose controllers to free resources
    pController.dispose();
    qController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    rsa = widget.rsa;
    pController.text = widget.rsa.p.toString();
    qController.text = widget.rsa.q.toString();
    textController.text = widget.rsa.encryptedText;
    privateKey = widget.rsa.privateKey.toString();
    publicKey = widget.rsa.publickey.toString();

    print('1: ${rsa.dectyptedText}');
    print('2: ${rsa.encryptedListCodeUnits}');
    print('3: ${rsa.privateKey}');
    print('4: ${rsa.publickey}');
  }

  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
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
    generateKeys();
  }

  void decryptText(String text) {
    rsa.decrypt();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: const Text("RSA Decryption"),
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
                                  const Icon(Icons.key),
                                  const SizedBox(width: 8),
                                  Text(publicKey),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(Icons.key_off),
                                  const SizedBox(width: 8),
                                  Text(privateKey),
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
                          labelText: "Insert text to decrypt",
                          controller: textController,
                        ),
                        const SizedBox(height: 96),
                        MyButton(
                          text: "Decrypt",
                          icon: Icons.add_circle_outline,
                          onPressed: () {
                            decryptText(textController.text);
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
                child: SelectableText(
                    rsa.dectyptedText.isEmpty ? "Encrypted text will show here" : rsa.dectyptedText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
