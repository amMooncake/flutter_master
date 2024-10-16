import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {
  final Color innerColor;
  final String? value;

  const MyPixel({required this.innerColor, this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 1,
        maxHeight: 1,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            color: innerColor,
            child: Center(
              child: Text(
                value == null ? " " : value!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
