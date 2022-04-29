import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:packman/ghost.dart';
import 'package:packman/path.dart';
import 'package:packman/wall.dart';
import 'package:packman/pacman.dart';

class GameScene extends StatefulWidget {
  const GameScene({Key? key}) : super(key: key);

  @override
  State<GameScene> createState() => _GameSceneState();
}

class _GameSceneState extends State<GameScene> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;

  static int playerInitPos = numberInRow * 15 + 1;

  // You can add more ghosts
  static List<int> ghostsInitPos = [
    numberInRow * 1 + 1,
    numberInRow * 2 - 2,
    numberInRow * 11 - 2,
  ];
  int player = playerInitPos;
  List<int> ghosts = List.from(ghostsInitPos);

  List<int> food = [];
  List<int> barriers = [
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
    22,
    33,
    44,
    55,
    66,
    77,
    99,
    110,
    121,
    132,
    143,
    154,
    165,
    21,
    32,
    43,
    54,
    65,
    76,
    87,
    109,
    120,
    131,
    142,
    153,
    164,
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
    186,
    24,
    35,
    46,
    57,
    26,
    37,
    38,
    39,
    28,
    30,
    41,
    52,
    63,
    78,
    79,
    80,
    81,
    70,
    59,
    61,
    72,
    83,
    84,
    85,
    86,
    100,
    101,
    102,
    103,
    114,
    125,
    123,
    134,
    145,
    156,
    158,
    147,
    148,
    149,
    160,
    127,
    116,
    105,
    106,
    107,
    108,
    129,
    140,
    151,
    162,
  ];

  String direction = 'hold';
  bool mouthClosed = false;
  bool gameStart = false;
  int score = 0;

  _GameSceneState() {
    getFood();
  }

  void restartGame() {
    setState(() {
      getFood();
      player = playerInitPos;
      ghosts = List.from(ghostsInitPos);
      score = 0;
      direction = 'hold';
    });
  }

  void startGame() {
    randomMoveGhost();

    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        mouthClosed = !mouthClosed;
      });

      if (food.contains(player)) {
        food.remove(player);
        score++;
      }

      if (ghosts.contains(player) || food.isEmpty) {
        restartGame();
        return;
      }

      switch (direction) {
        case 'left':
          moveLeft();
          break;
        case 'right':
          moveRight();
          break;
        case 'up':
          moveUp();
          break;
        case 'down':
          moveDown();
          break;
      }
    });

    setState(() {
      gameStart = true;
    });
  }

  void getFood() {
    food.clear();
    for (int i = 0; i < numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
  }

  void randomMoveGhost() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      for (int i = 0; i < ghosts.length; i++) {
        final List<int> next = [
          ghosts[i] - 1,
          ghosts[i] + 1,
          ghosts[i] + numberInRow,
          ghosts[i] - numberInRow
        ];
        next.shuffle();

        for (int j = 0; j < next.length; j++) {
          if (!barriers.contains(next[j])) {
            setState(() {
              ghosts[i] = next[j];
            });
            break;
          }
        }
      }
    });
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

  Widget renderScene(BuildContext context, int index) {
    if (ghosts.contains(index)) {
      return const Ghost();
    } else if (player == index) {
      if (mouthClosed) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
          ),
        );
      } else {
        switch (direction) {
          case 'left':
            return Transform.rotate(
              angle: pi,
              child: const PacMan(),
            );
          case 'right':
            return const PacMan();
          case 'up':
            return Transform.rotate(
              angle: 3 * pi / 2,
              child: const PacMan(),
            );
          case 'down':
            return Transform.rotate(
              angle: pi / 2,
              child: const PacMan(),
            );
        }
      }
      return const PacMan();
    } else if (barriers.contains(index)) {
      return Wall(
        innerColor: Colors.blue[800],
        outterColor: Colors.blue[900],
        //child: Text(index.toString()), // for debugging
      );
    } else if (!food.contains(index)) {
      return const Path(
        innerColor: Colors.black,
        outterColor: Colors.black,
        //child: Text(index.toString()), // for debugging
      );
    }
    return const Path(
      innerColor: Colors.yellow,
      outterColor: Colors.black,
      //child: Text(index.toString()), // for debugging
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: GestureDetector(
              onTap: () {
                direction =
                    'hold'; // why this? because it's really hard to control
              },
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  direction = 'down';
                } else if (details.delta.dy < 0) {
                  direction = 'up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  direction = 'right';
                } else if (details.delta.dx < 0) {
                  direction = 'left';
                }
              },
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: numberOfSquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numberInRow,
                ),
                itemBuilder: renderScene,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Score: " + score.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!gameStart) {
                        startGame();
                      } else {
                        restartGame();
                      }
                    },
                    child: gameStart == false
                        ? const Text('Play')
                        : const Text('Restart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
