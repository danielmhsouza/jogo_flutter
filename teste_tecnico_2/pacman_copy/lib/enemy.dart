import 'package:bonfire/bonfire.dart';
import 'package:flutter/rendering.dart';
import 'package:pacman_copy/spritesEnemy.dart';

class GameEnemy extends SimpleEnemy with ObjectCollision {
  bool canMove = true;
  GameEnemy({required Vector2 position, required Vector2 size})
      : super(
          position: position,
          size: size,
          speed: 40,
          animation: SimpleDirectionAnimation(
              idleRight: SpritesEnemy.enemyIdleRight,
              idleLeft: SpritesEnemy.enemyIdleLeft,
              runRight: SpritesEnemy.enemyRunRight,
              runLeft: SpritesEnemy.enemyRunLeft),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(size[0] - 7, size[1] - 13),
            align: Vector2(5, 13),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    if (canMove) {
      seeAndMoveToPlayer(
        closePlayer: (player) {
          _executeAtack();
        },
        radiusVision: 15 * 16,
      );
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 2,
      height: 2,
      align: const Offset(0, -5),
    );
    super.render(canvas);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirection == Direction.left) {
      animation?.playOnce(
        SpritesEnemy.damageLeft,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
    } else {
      animation?.playOnce(
        SpritesEnemy.damageRight,
        runToTheEnd: true,
        onFinish: () => canMove = true,
      );
    }
    super.receiveDamage(attacker, damage, identify);
  }

  void _executeAtack() {
    simpleAttackMelee(damage: 1, size: size, sizePush: 10);
  }
}
