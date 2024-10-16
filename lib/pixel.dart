import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {
  final Color innerColor;
  final int? index;

  const MyPixel({required this.innerColor, this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          color: innerColor,
          child: Center(
            child: Text(
              index == null ? " " : index.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
