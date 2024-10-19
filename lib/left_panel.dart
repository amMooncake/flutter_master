import 'package:flutter/material.dart';
import 'package:flutter_master/my_text_field.dart';

class MyLeftPanel extends StatelessWidget {
  final BorderRadiusGeometry myRadious;
  final Color left;
  final Color reset;
  final Color accept;
  final double myPadding;
  final TextEditingController textController;
  final TextEditingController outputText;
  final TextEditingController kluczController;
  final VoidCallback greenButtonPressed;
  final VoidCallback clearScreen;

  const MyLeftPanel({
    super.key,
    required this.myRadious,
    required this.left,
    required this.reset,
    required this.accept,
    required this.myPadding,
    required this.textController,
    required this.kluczController,
    required this.greenButtonPressed,
    required this.outputText,
    required this.clearScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsets.only(
            left: myPadding,
            top: myPadding,
            bottom: myPadding,
          ),
          child: ClipRRect(
            borderRadius: myRadious,
            child: Container(
              color: left,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("tekst", style: Theme.of(context).textTheme.displayMedium!.copyWith()),
                    MyTextField(myController: textController),
                    const SizedBox(height: 30),
                    Text("klucz", style: Theme.of(context).textTheme.displayMedium!.copyWith()),
                    MyTextField(myController: kluczController),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: myPadding,
                  bottom: myPadding,
                ),
                child: ClipRRect(
                  borderRadius: myRadious,
                  child: SizedBox(
                    height: double.infinity,
                    child: Material(
                      color: reset,
                      child: InkWell(
                        onTap: clearScreen,
                        child: const Icon(Icons.refresh, size: 75),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(bottom: myPadding, left: myPadding),
                child: ClipRRect(
                  borderRadius: myRadious,
                  child: SizedBox(
                    height: double.infinity,
                    child: Material(
                      color: accept,
                      child: InkWell(
                        onTap: greenButtonPressed,
                        child: const Icon(Icons.check, size: 75),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
