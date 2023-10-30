import '../my_game.dart';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'objects/paper.dart';
import 'objects/rock.dart';
import 'objects/scissor.dart';
import 'objects/walls.dart';

late SpriteAnimation explosion;

class GameLesson01 extends MyGame with TapCallbacks {

  final scissors = <Scissor>[];
  final papers = <Paper>[];
  final rocks = <Rock>[];

  final speed = Vector2(0, -9);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    for(var i=0; i<5; i++){
      final s = Scissor(Vector2(worldSize.x / 2,worldSize.y/3));
      // s.body.linearVelocity = speed;
      scissors.add(s);
      papers.add(Paper(Vector2(worldSize.x / 3, worldSize.y/7)));
      rocks.add(Rock(Vector2(worldSize.x / 4, worldSize.y/2)));
    }
    camera.moveTo(worldSize / 2);

    await loadSprite('scissor.png');
    await loadSprite('rock.png');
    await loadSprite('paper.png');

    world.add(FloorStatic());
    world.add(CeilingStatic());
    world.add(RightWall());
    world.add(LeftWall());

    world.addAll(scissors);
    world.addAll(papers);
    world.addAll(rocks);
  }

}
