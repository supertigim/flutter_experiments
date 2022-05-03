import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:rayworld/constants/constants.dart';
import 'package:rayworld/login_screen.dart';
import 'package:rayworld/ray_world_game.dart';
import 'package:rayworld/tools/joypad.dart';

import 'package:rayworld/tools/tcp_socket_connection.dart';

class GameScene extends StatefulWidget {
  const GameScene({Key? key}) : super(key: key);

  @override
  State<GameScene> createState() => _GameSceneState();
}

class _GameSceneState extends State<GameScene> {
  final RayWorldGame _game = RayWorldGame();
  TcpSocketConnection? _socketConnection;
  String message = "";

  void initConn(String ip, int port, String charName) {
    _game.nameMyPlayer(charName);

    setState(() {
      _socketConnection = TcpSocketConnection(ip, port);
      startConnection();
    });
  }

  void messageReceived(String msg) {
    _game.onMessageReceived(msg.split('|'));
  }

  //starting the connection and listening to the socket asynchronously
  void startConnection() async {
    _socketConnection!.connect(messageReceived);
  }

  @override
  Widget build(BuildContext context) {
    if (_socketConnection == null) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Stack(
          children: [
            LoginPage(
              title: 'Ray World',
              initConn: initConn,
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
          body: Stack(
            children: [
              GameWidget(game: _game),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Joypad(onDirectionChanged: onJoypadDirectionChanged),
                ),
              ),
            ],
          ));
    }
  }

  void onJoypadDirectionChanged(Direction direction) {
    _socketConnection!.sendMessage(_game.playerName() +
        "|" +
        direction.toString() +
        "|" +
        _game.playerPosition()); // formatted like 12.0 | 22.1111
    //_game.onJoypadDirectionChanged(direction);
  }
}
