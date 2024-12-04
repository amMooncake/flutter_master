import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.onChangedfunc,
  });
  final String labelText;
  final TextEditingController controller;
  final void Function(String text)? onChangedfunc;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChangedfunc ?? (text) {},
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
