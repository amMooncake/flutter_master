import 'package:flutter/material.dart';

class MyPath extends StatelessWidget {
  final Color innerColor;
  final Color outerColor;
  final child;

  const MyPath({required this.innerColor, required this.outerColor, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        padding: const EdgeInsets.all(12),
        color: outerColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: innerColor,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
