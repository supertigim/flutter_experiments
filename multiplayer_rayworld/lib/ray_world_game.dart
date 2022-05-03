import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'package:rayworld/components/player.dart';
import 'package:rayworld/components/world.dart';
import 'package:rayworld/constants/constants.dart';
import 'package:rayworld/tools/map_loader.dart';
import 'package:rayworld/components/world_collidable.dart';

class RayWorldGame extends FlameGame
    with HasCollisionDetection, KeyboardEvents {
  final World _world = World();
  final Player _player = Player();
  final Map<String, Player> _others = {};

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_world);
    add(_player);
    addWorldCollision();

    _player.position = _world.size / 2;
    camera.followComponent(_player,
        worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
  }

  String playerName() => _player.name();
  String playerDirection() => _player.direction.toString();
  String playerPosition() =>
      _player.position.x.toString() + "|" + _player.position.y.toString();

  void nameMyPlayer(String name) {
    _player.setName(name);
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }

  void onMessageReceived(List<String> msg) {
    final name = msg[0];
    Direction d = Direction.values.firstWhere((e) => e.toString() == msg[1]);
    if (kDebugMode) {
      print("Position(" + msg[2] + "," + msg[3] + ")");
    }
    double x = double.parse(msg[2]);
    double y = double.parse(msg[3]);
    // Vector2.fromBuffer(buffer, offset)
    if (name == _player.name()) {
      _player.direction = d;
    } else {
      if (!_others.containsKey(name)) {
        final newOne = Player();
        newOne.position = Vector2(x, y);
        newOne.setName(name);
        add(newOne);
        _others[name] = newOne;
      } else {
        _others[name]!.direction = d;
      }
    }
  }

  void addWorldCollision() async =>
      (await MapLoader.readRayWorldCollisionMap()).forEach((rect) {
        add(WorldCollidable()
          ..position = Vector2(rect.left, rect.top)
          ..width = rect.width
          ..height = rect.height);
      });

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    Direction? keyDirection;

    if (event.logicalKey == LogicalKeyboardKey.keyA) {
      keyDirection = Direction.left;
    } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
      keyDirection = Direction.right;
    } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
      keyDirection = Direction.up;
    } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
      keyDirection = Direction.down;
    }

    if (isKeyDown && keyDirection != null) {
      _player.direction = keyDirection;
    } else if (_player.direction == keyDirection) {
      _player.direction = Direction.none;
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
