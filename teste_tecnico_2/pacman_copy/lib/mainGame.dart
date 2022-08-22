import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
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
      map: TiledWorldMap(
        'maps/map.json',
      ),

      //***************************************************PLAYER
      player: GamePlayer(
        position: Vector2(23 * tileSize, 46 * tileSize),
        size: Vector2(tileSize, tileSize),
      ),

      //***************************************************CAMERA
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1.7,
        sizeMovementWindow: Vector2(tileSize * 4, tileSize * 4),
      ),

      //***************************************************COMPONENTS
      components: [
        //***********************************ENEMIES
        GameEnemy(
          position: Vector2(17 * tileSize, 26 * tileSize),
          size: Vector2(tileSize + 8, tileSize + 8),
        ),
        GameEnemy(
          position: Vector2(19 * tileSize, 26 * tileSize),
          size: Vector2(tileSize + 8, tileSize + 8),
        ),
        GameEnemy(
          position: Vector2(21 * tileSize, 26 * tileSize),
          size: Vector2(tileSize + 8, tileSize + 8),
        ),
        GameEnemy(
          position: Vector2(23 * tileSize, 26 * tileSize),
          size: Vector2(tileSize + 8, tileSize + 8),
        ),
      ],
      showCollisionArea: false,
    );
  }
}
