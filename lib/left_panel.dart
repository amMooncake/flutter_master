import 'package:flutter/material.dart';
import 'package:flutter_master/my_text_field.dart';

class MyLeftPanel extends StatelessWidget {
  final BorderRadiusGeometry myRadious;
  final Color left;
  final Color reset;
  final Color accept;

  const MyLeftPanel({
    super.key,
    required this.myRadious,
    required this.left,
    required this.reset,
    required this.accept,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
            bottom: 10,
          ),
          child: ClipRRect(
            borderRadius: myRadious,
            child: Container(
              color: left,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "tekst",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(),
                    ),
                    const SizedBox(height: 50),
                    const MyTextField(),
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
                padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                ),
                child: ClipRRect(
                  borderRadius: myRadious,
                  child: SizedBox(
                    height: double.infinity,
                    child: Material(
                      color: reset,
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.refresh, size: 75),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: ClipRRect(
                  borderRadius: myRadious,
                  child: SizedBox(
                    height: double.infinity,
                    child: Material(
                      color: accept,
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.check, size: 75),
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
