import 'package:flutter/material.dart';

class AlphabetGrid extends StatelessWidget {
  final String? alphabetString;

  const AlphabetGrid({super.key, this.alphabetString});

  static const List<int> borders = [1, 2, 3, 4, 5, 6, 7, 8, 16, 24, 32, 40];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.6),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 8 * 6,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            color: Colors.red,
          );
        } else if (borders.contains(index)) {
          return Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                (index < 8 ? index : index / 8).toString(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
              ),
            ),
          );
        } else if (alphabetString != null) {
          int i = (index - 8 - (index ~/ 8));
          return Container(
            color: Colors.green,
            child: Center(
              child: Text(
                alphabetString![i],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.orange,
            child: Center(
              child: Text(
                (index - 7 - (index ~/ 8)).toString(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
              ),
            ),
          );
        }
      },
    );
  }
}
