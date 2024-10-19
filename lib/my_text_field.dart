import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 6,
      cursorColor: Colors.white,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
      decoration: const InputDecoration(
        hoverColor: Colors.red,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 6),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
