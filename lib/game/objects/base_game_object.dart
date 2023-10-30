import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import '../../utils/constants.dart';
import 'object_state.dart';

class BaseGameObject extends BodyComponent with ContactCallbacks {
  final Vector2 startPosition;
  final Vector2 linearVelocity;
  BaseGameObject(this.startPosition, this.linearVelocity);
  ObjectState state = ObjectState.normal;

  @override
  void update(double dt) {
    super.update(dt);

    if (state == ObjectState.explode) {
      world.destroyBody(body);
      game.world.remove(this);
    }
  }

  void hit() {
    if (state == ObjectState.normal) {
      state = ObjectState.explode;
      game.world.add(SpriteAnimationComponent(
        position: body.position,
        anchor: Anchor.center,
        size: componentSize,
        removeOnFinish: true,
      ));
    }
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: startPosition,
      type: BodyType.dynamic,
    );

    final shape = PolygonShape()..setAsBoxXY(.25, .25);

    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = 0
      ..restitution = 1;

    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..linearVelocity = linearVelocity;
  }

}
