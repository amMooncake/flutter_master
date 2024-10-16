import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master/pixel.dart';
import 'package:flutter_master/key.dart';

class MyEncryption extends StatelessWidget {
  const MyEncryption({super.key});

  static List<int> borders = [1, 2, 3, 4, 5, 6, 7, 8, 16, 24, 32, 40];
  final String encryptedText = "tu pojawi się tekst zaszyfrowany";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            if (index == 0) {
                              print(alphabetPl[9]);
                              return const MyPixel(innerColor: Colors.grey, value: null);
                            } else if (borders.contains(index)) {
                              return MyPixel(
                                  innerColor: Colors.red[300]!,
                                  value: index < 8 ? index.toString() : (index % 7).toString());
                            } else {
                              return MyPixel(innerColor: Colors.green[300]!, value: alphabetPl[index]);
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
                                controller: TextEditingController(text: "1"),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tekst do szyfrowania:", style: Theme.of(context).textTheme.displayLarge!),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: TextField(),
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
                        Text(encryptedText, style: Theme.of(context).textTheme.displayLarge!),
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
