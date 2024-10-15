import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_master/pixel.dart';
import 'package:flutter_master/Path.dart';
import 'package:flutter_master/player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int player = numberInRow * 15 + 1;

  static List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    21,
    22,
    24,
    26,
    28,
    30,
    32,
    33,
    35,
    37,
    38,
    39,
    41,
    43,
    44,
    46,
    52,
    54,
    55,
    57,
    59,
    61,
    63,
    65,
    66,
    70,
    72,
    76,
    77,
    78,
    79,
    80,
    81,
    83,
    84,
    85,
    86,
    87,
    99,
    100,
    101,
    102,
    103,
    105,
    106,
    107,
    108,
    109,
    110,
    114,
    116,
    120,
    121,
    123,
    125,
    127,
    129,
    131,
    132,
    134,
    140,
    142,
    143,
    145,
    147,
    148,
    149,
    151,
    153,
    154,
    156,
    158,
    160,
    162,
    164,
    165,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186
  ];

  List<int> food = [];
  String direction = "right";

  void startGame() {
    getFood();
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (food.contains(player)) {
        food.remove(player);
      }

      switch (direction) {
        case "left":
          moveLeft();
          break;
        case "right":
          moveRight();
          break;
        case "up":
          moveUp();
          break;
        case "down":
          moveDown();
          break;
      }
    });
  }

  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
  }

  void moveLeft() {
    if (!barriers.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

  void moveRight() {
    if (!barriers.contains(player + 1)) {
      setState(() {
        player++;
      });
    }
  }

  void moveUp() {
    if (!barriers.contains(player - numberInRow)) {
      setState(() {
        player -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (!barriers.contains(player + numberInRow)) {
      setState(() {
        player += numberInRow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  direction = "down";
                } else if (details.delta.dy < 0) {
                  direction = "up";
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  direction = "right";
                } else if (details.delta.dx < 0) {
                  direction = "left";
                }
              },
              child: Container(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: numberInRow),
                  itemBuilder: (BuildContext ctx, int index) {
                    if (player == index) {
                      switch (direction) {
                        case "left":
                          return Transform.rotate(angle: pi, child: const MyPlayer());
                        case "right":
                          return Transform.rotate(angle: pi * 0, child: const MyPlayer());
                        case "up":
                          return Transform.rotate(angle: pi * 3 / 2, child: const MyPlayer());
                        case "down":
                          return Transform.rotate(angle: pi / 2, child: const MyPlayer());
                        default:
                          return MyPlayer();
                      }
                    } else if (barriers.contains(index)) {
                      return MyPixel(
                        innerColor: Colors.blue[800]!,
                        outerColor: Colors.blue[900]!,
                      );
                    } else if (!food.contains(index)) {
                      return MyPixel(
                        innerColor: Colors.black,
                        outerColor: Colors.black,
                      );
                    } else {
                      return const MyPath(
                        innerColor: Colors.yellow,
                        outerColor: Colors.black,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Score: ",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  GestureDetector(
                    onTap: startGame,
                    child: Text(
                      "P L A Y ",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
