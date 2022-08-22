import 'package:bonfire/bonfire.dart';

class ObjectAny {
  final double x;
  final double y;
  ObjectAny(this.x, this.y);

  bool touched(
      {required Vector2 position,
      required Vector2 size,
      double? biggerThenX,
      double? biggerThenY}) {
    double playerX = position[0];
    double playerY = position[1];

    if (playerX <= x &&
        playerX >= biggerThenX! &&
        playerY <= y &&
        playerY >= biggerThenY!) {
      return true;
    }

    return false;
  }
}
