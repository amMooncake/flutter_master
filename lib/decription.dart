import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master/pixel.dart';
// import 'package:flutter_master/key.dart';
import 'package:flutter_master/encryption_logic.dart';

class MyDecription extends StatefulWidget {
  final Map<int, String> alphabet;

  const MyDecription(this.alphabet, {super.key});

  static List<int> borders = [2, 3, 4, 5, 6, 7, 8, 9, 17, 25, 33, 41];

  @override
  State<MyDecription> createState() => _MyDecriptionState();
}

class _MyDecriptionState extends State<MyDecription> {
  String decryptedText = "tu pojawi się tekst odszyfrowany";
  late TextEditingController aController;
  late TextEditingController bController;
  late TextEditingController textController;

  String a = '';
  String b = '';
  String text = '';

  @override
  void initState() {
    super.initState();
    aController = TextEditingController();
    bController = TextEditingController();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    aController.dispose();
    bController.dispose();
    textController.dispose();
    super.dispose();
  }

  void myFunction() {
    a = aController.text;
    b = bController.text;
    text = textController.text;
    if (a.isEmpty || b.isEmpty || text == 0) {
      return;
    }
    decryptedText = "**Błąd**";
    setState(() {});
    decryptedText = decrypt(double.parse(text), int.parse(a), int.parse(b)).toString();
    // encryptedText = "$a, $b, $text";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFeae2b7),
        title: const Text("Dekrypcja"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(child: Text("klucz 1", style: Theme.of(context).textTheme.displayLarge)),
                      Expanded(
                        flex: 8,
                        child: GridView.builder(
                          itemCount: 8 * 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
                          itemBuilder: (context, index) {
                            index += 1;
                            if (index == 1) {
                              return const MyPixel(innerColor: Colors.grey, value: null);
                            } else if (MyDecription.borders.contains(index)) {
                              return MyPixel(
                                  innerColor: Colors.red[300]!,
                                  value:
                                      index < 9 ? (index - 1).toString() : ((index - 1) / 8).toString());
                            } else {
                              return MyPixel(
                                  innerColor: Colors.green[300]!, value: widget.alphabet[index]);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Klucz 2",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("a:  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: Colors.white)),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: aController,
                                decoration: InputDecoration.collapsed(
                                    hintText: "number",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(color: Colors.white30)),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: Colors.white),
                                maxLength: 3,
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("b:  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: Colors.white)),
                            Expanded(
                              child: TextField(
                                controller: bController,
                                decoration: InputDecoration.collapsed(
                                    hintText: "number",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(color: Colors.white30)),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: Colors.white),
                                maxLength: 3,
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[350],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Liczba do odszyfrowania:",
                            style: Theme.of(context).textTheme.displayLarge!),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: textController,
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.red),
                            decoration: InputDecoration.collapsed(
                                hintText: "tu wpisz tekst zaszyfrowany",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: Colors.black38)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: myFunction,
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                            minimumSize: const WidgetStatePropertyAll(Size(100, 50)),
                            textStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.displayLarge),
                            foregroundColor: const WidgetStatePropertyAll(Colors.black),
                            backgroundColor: const WidgetStatePropertyAll(Colors.red),
                          ),
                          child: const Text("odszyfruj"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(decryptedText, style: Theme.of(context).textTheme.displayLarge!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}