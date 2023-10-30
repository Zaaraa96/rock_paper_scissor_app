import '../my_game.dart';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'objects/paper.dart';
import 'objects/rock.dart';
import 'objects/scissor.dart';
import 'objects/walls.dart';

late SpriteAnimation explosion;

class Game01 extends MyGame with TapCallbacks {

  final scissors = <Scissor>[];
  final papers = <Paper>[];
  final rocks = <Rock>[];

  final speed = Vector2(0, -9);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    for(var i=0; i<5; i++){
      scissors.add(Scissor(
          Vector2(worldSize.x * getRandomDouble(),worldSize.y* getRandomDouble()),
          Vector2(getRandomSignedInt(), getRandomSignedInt())));
      papers.add(Paper(Vector2(worldSize.x * getRandomDouble(), worldSize.y* getRandomDouble()),
          Vector2(getRandomSignedInt(), getRandomSignedInt())));
      rocks.add(Rock(Vector2(worldSize.x * getRandomDouble(), worldSize.y* getRandomDouble()),
    Vector2(getRandomSignedInt(), getRandomSignedInt())));

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

double getRandomDouble(){
  return Random.secure().nextDouble();
}

double getRandomSignedInt(){
return Random.secure().nextInt(10) -  5; //-5 to 5
}


