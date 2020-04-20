import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:race/componets/bg.dart';
import 'package:race/componets/button-jump.dart';
import 'package:race/componets/knight.dart';

class GameController extends Game
    with TapDetector, PanDetector, DoubleTapDetector {
  Size screenSize;
  double tileSize;
  Background background;
  Knight car;
  ButtonJump buttonJump;
  GameController() {
    initilize();
  }
  void initilize() async {
    resize(await Flame.util.initialDimensions());
    background = Background(this);
    car = Knight(this);
    buttonJump = ButtonJump(this);
  }

  @override
  void render(Canvas c) {
    background.render(c);
    car.render(c);
    buttonJump.render(c);
  }

  @override
  void update(double t) {
    car.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  @override
  void onTapUp(TapUpDetails details) {
    print("tap up");
    if (buttonJump.rect.contains(details.globalPosition)) {
    } else {
      car.onTapDownDecrease();
    }
  }

  @override
  void onTapDown(TapDownDetails details) {
    print("tap down");
    if (buttonJump.rect.contains(details.globalPosition)) {
      car.onJump();
      print('Jump');
      // car.onRun();
    } else {
      if (details.globalPosition.dx > screenSize.width / 2) {
        car.onTapDownIncease();
      } else {
        car.goBack();
      }
    }
  }

  @override
  void onTapCancel() {
    print("tap cancel");
    car.onTapDownDecrease();
  }

  @override
  void onDoubleTap() {
    car.onRun();
  }
}
