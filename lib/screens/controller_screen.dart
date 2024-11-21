import 'package:flutter/material.dart';

import 'package:flutter_master/screens/about_screen.dart';
import 'package:flutter_master/widgets/my_button_car.dart';

class CarController extends StatefulWidget {
  const CarController({super.key});

  @override
  State<CarController> createState() => _CarControllerState();
}

class _CarControllerState extends State<CarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutMyApp()));
            },
          ),
        ],
        title: Text('WSEI car Controller',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary)),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          height: MediaQuery.sizeOf(context).height * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButtonCar(icon: Icons.arrow_upward, yealdNumber: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButtonCar(icon: Icons.arrow_back, yealdNumber: 2),
                  MyButtonCar(icon: Icons.arrow_forward, yealdNumber: 3),
                ],
              ),
              MyButtonCar(icon: Icons.arrow_downward, yealdNumber: 4),
            ],
          ),
        ),
      ),
    );
  }
}
