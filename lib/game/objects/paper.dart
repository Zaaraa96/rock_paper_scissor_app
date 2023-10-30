import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:rock_paper_scissor_app/game/objects/scissor.dart';
import '../../utils/constants.dart';
import 'base_game_object.dart';


class Paper extends BaseGameObject {
   @override
  final Vector2 startPosition;
   @override
  final Vector2 linearVelocity;
   Paper(this.startPosition, this.linearVelocity) : super(startPosition, linearVelocity);


  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
    final sprite = Sprite(game.images.fromCache('paper.png'));

    add(SpriteComponent(
      sprite: sprite,
      size: componentSize,
      anchor: Anchor.center,
    ));
  }
  @override
  void beginContact(Object other, Contact contact) {
    if (other is Scissor) {
      hit();
    }
  }
}