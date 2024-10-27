import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  final String hintText;

  const MyTextField({super.key, required this.myController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 2,
      controller: myController,
      keyboardType: TextInputType.multiline,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
      decoration: InputDecoration(
        hintText: hintText,
        hoverColor: Colors.red,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 50),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
      ),
    );
  }
}
