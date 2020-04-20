import 'dart:ui';

import 'package:flame/sprite.dart';

import '../game_controller.dart';

class ButtonJump {
  final GameController game;
  Rect rect;
  Sprite sprite;
  ButtonJump(this.game) {
    rect = Rect.fromLTWH(
      0,
      0,
      game.tileSize,
      game.tileSize,
    );
    sprite = Sprite('Knight/Jump/jump3.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {}
}
