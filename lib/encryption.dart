import 'package:flutter/material.dart';
import 'package:flutter_master/pixel.dart';
import 'package:flutter_master/key.dart';

class MyEncryption extends StatelessWidget {
  const MyEncryption({super.key});

  static List<int> borders = [1, 2, 3, 4, 5, 6, 7, 8, 16, 24, 32, 40];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: 8 * 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const MyPixel(innerColor: Colors.red, index: null);
                } else if (borders.contains(index)) {
                  return MyPixel(innerColor: Colors.red[300]!, index: index < 8 ? index : index % 7);
                } else {
                  return MyPixel(innerColor: Colors.green[300]!, index: index);
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
      ]),
    );
  }
}
