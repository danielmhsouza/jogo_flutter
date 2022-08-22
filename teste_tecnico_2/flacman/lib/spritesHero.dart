import 'package:bonfire/bonfire.dart';

class SpritesHero {
  //SPRITES HERO

  static Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(
        'personas/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
          stepTime: 0.15,
        ),
      );

  static Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(
        'personas/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
          stepTime: 0.15,
        ),
      );

  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'personas/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 48),
          stepTime: 0.15,
        ),
      );

  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'personas/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
          stepTime: 0.15,
        ),
      );

  static Future<SpriteAnimation> get damageLeft => SpriteAnimation.load(
        'personas/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 24 * 4),
          stepTime: 0.15,
        ),
      );
  static Future<SpriteAnimation> get damageRight => SpriteAnimation.load(
        'personas/lancelot_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 24 * 4),
          stepTime: 0.15,
        ),
      );
}
