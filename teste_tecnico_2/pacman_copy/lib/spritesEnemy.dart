import 'package:bonfire/bonfire.dart';

class SpritesEnemy {
  //SPRITES ENEMY

  static Future<SpriteAnimation> get enemyIdleLeft => SpriteAnimation.load(
        'personas/ogre_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(28, 32),
          texturePosition: Vector2(29 * 4, 0),
          stepTime: 0.15,
        ),
      );

  static Future<SpriteAnimation> get enemyIdleRight => SpriteAnimation.load(
        'personas/ogre_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(28, 32),
          texturePosition: Vector2(0, 0),
          stepTime: 0.15,
        ),
      );

  static Future<SpriteAnimation> get enemyRunLeft => SpriteAnimation.load(
        'personas/ogre_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(28, 32),
          texturePosition: Vector2(29 * 4, 32),
          stepTime: 0.15,
        ),
      );

  static Future<SpriteAnimation> get enemyRunRight => SpriteAnimation.load(
        'personas/ogre_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(28, 32),
          texturePosition: Vector2(0, 32),
          stepTime: 0.15,
        ),
      );

  static Future<SpriteAnimation> get damageLeft => SpriteAnimation.load(
        'personas/ogre_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(28, 32),
          texturePosition: Vector2(28 * 5, 32 * 3.5),
          stepTime: 0.15,
        ),
      );
  static Future<SpriteAnimation> get damageRight => SpriteAnimation.load(
        'personas/ogre_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(28, 32),
          texturePosition: Vector2(0, 32 * 3.5),
          stepTime: 0.15,
        ),
      );
}
