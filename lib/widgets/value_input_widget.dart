import 'package:flutter/material.dart';
import 'my_text_field_widget.dart';

class ValueInput extends StatelessWidget {
  final TextEditingController keyTextController;
  final Function encrypt;

  const ValueInput({super.key, required this.keyTextController, required this.encrypt});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: MyTextField(
            myController: keyTextController,
            hintText: 'Wprowadź klucz',
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              encrypt(keyTextController.text);
            },
            child: const Text("wyślij"),
          ),
        ),
      ],
    );
  }
}
