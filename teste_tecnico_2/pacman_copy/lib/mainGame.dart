import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:pacman_copy/objects.dart';
import 'package:pacman_copy/player.dart';

import 'enemy.dart';

double tileSize = 16;

class GameController extends StatelessWidget {
  const GameController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      //***************************************************JOYSTICK
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(),
        directional: JoystickDirectional(color: Colors.red),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.red,
            margin: const EdgeInsets.all(50),
          ),
        ],
      ),

      //***************************************************MAP
      map: TiledWorldMap('maps/map.json', objectsBuilder: {
        'ogre': ((properties) => GameEnemy(
              position: properties.position,
              size: Vector2(properties.size[0] + 8, properties.size[1] + 8),
            )),
        'fireLight': ((properties) => Fire(
              position: properties.position,
              size: Vector2(properties.size[0] + 8, properties.size[1] + 8),
            )),
      }),

      //***************************************************PLAYER
      player: GamePlayer(
        position: Vector2(23 * tileSize, 46 * tileSize),
        size: Vector2(tileSize, tileSize),
      ),

      //***************************************************CAMERA
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1.9,
        sizeMovementWindow: Vector2(tileSize * 4, tileSize * 4),
      ),
      lightingColorGame: Colors.black.withOpacity(0.5),

      showCollisionArea: false,
    );
  }
}
