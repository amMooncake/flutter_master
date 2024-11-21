import 'package:flutter/material.dart';

class MyButtonCar extends StatefulWidget {
  final IconData icon;
  final int yealdNumber;
  const MyButtonCar({super.key, required this.icon, required this.yealdNumber});

  @override
  State<MyButtonCar> createState() => _MyButtonCarState();
}

class _MyButtonCarState extends State<MyButtonCar> {
  bool _buttonPressed = false;
  bool _loopActive = false;
  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;
    _loopActive = true;

    while (_buttonPressed) {
      print(widget.yealdNumber);
      await Future.delayed(const Duration(milliseconds: 100));
    }
    _loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Listener(
        onPointerDown: (details) {
          _buttonPressed = true;
          setState(() {});
          _increaseCounterWhilePressed();
        },
        onPointerUp: (details) {
          _buttonPressed = false;
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: !_buttonPressed
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary,
          ),
          width: 100,
          height: 100,
          child: Icon(
            widget.icon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
