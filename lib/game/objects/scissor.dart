import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import '../../utils/constants.dart';
import 'base_game_object.dart';
import 'object_state.dart';
import 'rock.dart';

class Scissor extends BaseGameObject {
  @override
  final Vector2 startPosition;
  @override
  final Vector2 linearVelocity;
  Scissor(this.startPosition, this.linearVelocity) : super(startPosition, linearVelocity);

  ObjectState state = ObjectState.normal;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
    final sprite = Sprite(game.images.fromCache('scissor.png'));

    add(SpriteComponent(
      sprite: sprite,
      size: componentSize,
      anchor: Anchor.center,
    ));
  }


  @override
  void beginContact(Object other, Contact contact) {
    if (other is Rock) {
      hit();
    }
  }
}
