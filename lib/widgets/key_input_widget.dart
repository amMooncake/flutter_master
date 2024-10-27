import 'package:flutter/material.dart';
import 'my_text_field_widget.dart';

class KeyInput extends StatelessWidget {
  final TextEditingController keyTextController;
  final Function alphabetGridEdit;

  const KeyInput({super.key, required this.keyTextController, required this.alphabetGridEdit});

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
          child: ElevatedButton.icon(
            onPressed: () {
              alphabetGridEdit(keyTextController.text);
            },
            label: const Text("zmień"),
            icon: const Icon(Icons.key),
          ),
        ),
      ],
    );
  }
}
