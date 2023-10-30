import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:rock_paper_scissor_app/game/objects/paper.dart';
import '../../utils/constants.dart';
import 'object_state.dart';
class Rock extends BodyComponent with ContactCallbacks {
  ObjectState state = ObjectState.normal;
  final Vector2 startPosition;
  Rock(this.startPosition);
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    renderBody = false;
    final sprite = Sprite(game.images.fromCache('rock.png'));

    add(SpriteComponent(
      sprite: sprite,
      size: componentSize,
      anchor: Anchor.center,
    ));
  }

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
      ..angularVelocity = radians(180)..linearVelocity = Vector2(3, -5);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Paper) {
      hit();
    }
  }
}
