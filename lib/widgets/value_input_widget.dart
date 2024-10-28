import 'package:flutter/material.dart';
import 'my_text_field_widget.dart';

class ValueInput extends StatelessWidget {
  final TextEditingController keyTextController;
  final Function function;

  const ValueInput({super.key, required this.keyTextController, required this.function});

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
            hintText: 'Wprowadź zdanie',
          ),
        ),
        SizedBox(width: screenWidth * 0.05),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              function(keyTextController.text);
            },
            child: const Text("wyślij"),
          ),
        ),
      ],
    );
  }
}
