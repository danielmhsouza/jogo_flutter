import 'package:bonfire/bonfire.dart';
import 'package:pacman_copy/spritesHero.dart';

import 'objects.dart';

class GamePlayer extends SimplePlayer with ObjectCollision {
  bool canAtack = true;

  GamePlayer({required Vector2 position, required Vector2 size})
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpritesHero.heroIdleRight,
            idleLeft: SpritesHero.heroIdleLeft,
            runRight: SpritesHero.heroRunRight,
            runLeft: SpritesHero.heroRunLeft,
          ),
          speed: 60,
          size: Vector2(size[0] + 4, size[1] + 4),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(size[0] - 7, size[1] - 10),
            align: Vector2(5, 14),
          ),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    //************************PORTAIS
    //
    //
    ObjectAny portalLeft = ObjectAny(1 * size[0] + 4, 20 * size[0] + 4);
    ObjectAny portalRight = ObjectAny(31 * size[0] + 4, 20 * size[0] + 4);
    if (active &&
        portalLeft.touched(
          position: position,
          size: size,
          biggerThenX: 0 * size[0] + 4,
          biggerThenY: 18 * size[0] + 4,
        )) {
      position = Vector2(portalRight.x - (2 * size[0]), position[1]);
    }
    if (active &&
        portalRight.touched(
          position: position,
          size: size,
          biggerThenX: 30 * size[0] + 4,
          biggerThenY: 18 * size[0] + 4,
        )) {
      position = Vector2(portalLeft.x + (2 * size[0]), position[1]);
    }

    //************************PORTAIS
    //
    //

    return super.onCollision(component, active);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (canAtack) {
      if (event.event == ActionEvent.DOWN && event.id == 1) {
        _executeAtack();
      }
    }
    super.joystickAction(event);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if (lastDirection == Direction.left) {
      animation?.playOnce(SpritesHero.damageLeft, runToTheEnd: true);
    } else if (lastDirection == Direction.right) {
      animation?.playOnce(SpritesHero.damageRight, runToTheEnd: true);
    }
    super.receiveDamage(attacker, damage, identify);
  }

  void _executeAtack() {
    simpleAttackMelee(
      damage: 20,
      size: size,
      sizePush: 10,
    );
  }
}
