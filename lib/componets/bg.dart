import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:race/game_controller.dart';

class Background {
  final GameController game;
  Sprite bgSprite;
  Rect bgRect;
  Background(this.game) {
    bgSprite = Sprite('PNG/City1/Pale/City1.png');
    bgRect = Rect.fromLTWH(
      0,
     0,
      game.screenSize.width,
      game.screenSize.height,
    );
  }
    void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }
}
