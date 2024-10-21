import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;

  const MyTextField({super.key, required this.myController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 2,
      controller: myController,
      keyboardType: TextInputType.multiline,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
      decoration: const InputDecoration(
        hoverColor: Colors.red,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 50),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
      ),
    );
  }
}
