import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/collisions.dart';

import 'package:rayworld/constants/constants.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  final double _playerSpeed = 300.0;
  final double _animationSpeed = 0.15;

  late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  SpriteAnimation? _standingAnimation;

  Direction _collisionDirection = Direction.none;
  bool _hasCollided = false;

  Direction direction = Direction.none;

  late final nameComp = TextComponent(text: '')
    ..anchor = Anchor.topCenter
    ..x = size.x / 2 // size is a property from game
    ..y = size.y / -2;

  Player() : super(size: Vector2.all(50.5)) {
    add(RectangleHitbox());
    add(nameComp);
    // add(TextComponent(
    //   text: name,
    // )
    // ..anchor = Anchor.topCenter
    // ..x = size.x / 2 // size is a property from game
    // ..y = size.y / -2);
  }

  String name() => nameComp.text;

  void setName(String name) {
    nameComp.text = name;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _loadAnimations().then((_) => {animation = _standingAnimation});
    // sprite = await gameRef.loadSprite('player.png');
    //position = gameRef.size / 2;
  }

  @override
  void update(double dt) {
    super.update(dt);
    movePlayer(dt);
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('player_spritesheet.png'),
      srcSize: Vector2(29.0, 32.0),
    );

    _runDownAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 4);

    _runLeftAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 4);

    _runUpAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: _animationSpeed, to: 4);

    _runRightAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: _animationSpeed, to: 4);

    _standingAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 1);
  }

  void movePlayer(double dt) {
    switch (direction) {
      case Direction.up:
        if (canPlayerMoveUp()) {
          animation = _runUpAnimation;
          moveUp(dt);
        }
        break;
      case Direction.down:
        if (canPlayerMoveDown()) {
          animation = _runDownAnimation;
          moveDown(dt);
        }
        break;
      case Direction.left:
        if (canPlayerMoveLeft()) {
          animation = _runLeftAnimation;
          moveLeft(dt);
        }
        break;
      case Direction.right:
        if (canPlayerMoveRight()) {
          animation = _runRightAnimation;
          moveRight(dt);
        }
        break;
      case Direction.none:
        animation = _standingAnimation;
        break;
    }
  }

  void moveUp(double dt) {
    position.add(Vector2(0, -dt * _playerSpeed));
  }

  void moveDown(double dt) {
    position.add(Vector2(0, dt * _playerSpeed));
  }

  void moveLeft(double dt) {
    position.add(Vector2(-dt * _playerSpeed, 0));
  }

  void moveRight(double dt) {
    position.add(Vector2(dt * _playerSpeed, 0));
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (!_hasCollided) {
      _hasCollided = true;
      _collisionDirection = direction;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    _hasCollided = false;
  }

  bool canPlayerMoveUp() {
    if (_hasCollided && _collisionDirection == Direction.up) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveDown() {
    if (_hasCollided && _collisionDirection == Direction.down) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveLeft() {
    if (_hasCollided && _collisionDirection == Direction.left) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveRight() {
    if (_hasCollided && _collisionDirection == Direction.right) {
      return false;
    }
    return true;
  }
}
