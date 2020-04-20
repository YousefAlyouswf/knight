import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:race/game_controller.dart';

class Knight {
  final GameController game;
  Rect carRect;
  List<Sprite> knights;
  double knightIndex = 0;
  double speed = 0;
  bool walk = false;
  bool jump = false;
  bool running = false;
  bool walkBack = false;
  Offset targetLocation;
  List<Sprite> run;
  List<Sprite> jumps;
  double get speedJump {
    return game.tileSize * 2;
  }

  Sprite knightStop;
  Knight(this.game) {
    carRect = Rect.fromLTWH(
      game.screenSize.width / 2.5 - game.tileSize,
      game.screenSize.height / 1.5,
      game.tileSize,
      game.tileSize,
    );
    knightStop = Sprite('Knight/knight.png');
    knights = List();
    knights.add(Sprite('Knight/Walk/walk1.png'));
    knights.add(Sprite('Knight/Walk/walk2.png'));
    knights.add(Sprite('Knight/Walk/walk3.png'));
    knights.add(Sprite('Knight/Walk/walk4.png'));
    knights.add(Sprite('Knight/Walk/walk5.png'));
    knights.add(Sprite('Knight/Walk/walk6.png'));
    run = List();
    run.add(Sprite('Knight/Run/run1.png'));
    run.add(Sprite('Knight/Run/run2.png'));
    run.add(Sprite('Knight/Run/run3.png'));
    run.add(Sprite('Knight/Run/run4.png'));
    run.add(Sprite('Knight/Run/run5.png'));
    run.add(Sprite('Knight/Run/run6.png'));
    run.add(Sprite('Knight/Run/run7.png'));
    run.add(Sprite('Knight/Run/run8.png'));
    jumps = List();
    jumps.add(Sprite('Knight/Jump/jump1.png'));
    jumps.add(Sprite('Knight/Jump/jump2.png'));
    jumps.add(Sprite('Knight/Jump/jump3.png'));
    jumps.add(Sprite('Knight/Jump/jump4.png'));
    jumps.add(Sprite('Knight/Jump/jump5.png'));
    jumps.add(Sprite('Knight/Jump/jump6.png'));
    jumps.add(Sprite('Knight/Jump/jump7.png'));
    setTargetLocation();
  }
  void render(Canvas c) {
    if (walk) {
      knights[knightIndex.toInt()]
          .renderRect(c, carRect.inflate(carRect.width / 2));
    } else if (jump) {
      jumps[knightIndex.toInt()]
          .renderRect(c, carRect.inflate(carRect.width / 2));
    } else if (running || walkBack) {
      run[knightIndex.toInt()]
          .renderRect(c, carRect.inflate(carRect.width / 2));
    } else {
      knightStop.renderRect(c, carRect.inflate(carRect.width / 2));
    }
  }

  void update(double t) {
    if (jump) {
      knightIndex += speed * t;
      carRect = carRect.shift(Offset(0, -5));
      if (knightIndex >= 3) {
        carRect = carRect.shift(Offset(0, 8.56));
        if (knightIndex >= 7) {
          knightIndex -= 7;
          jump = false;
        }
      }
    } else if (running) {
      knightIndex += speed * t;
      carRect = carRect.shift(Offset(4, 0));
      if (carRect.right > game.screenSize.width) {
        carRect = carRect.shift(Offset(-4, 0));
      }
      if (knightIndex >= 8) {
        knightIndex -= 8;
      }
    } else if (walk) {
      knightIndex += speed * t;
      carRect = carRect.shift(Offset(2, 0));
      if (carRect.right > game.screenSize.width) {
        carRect = carRect.shift(Offset(-2, 0));
      }

      if (knightIndex >= 6) {
        knightIndex -= 6;
      }
    } else if (walkBack) {
      knightIndex += speed * t;
      carRect = carRect.shift(Offset(-4, 0));
      if (carRect.left < 5) {
        carRect = carRect.shift(Offset(4, 0));
      }

      if (knightIndex >= 6) {
        knightIndex -= 6;
      }
    }
  }

  void goBack() {
    knightIndex = 0;
    walk = false;
    jump = false;
    running = false;
    walkBack = true;
    speed = 15;
  }

  void setTargetLocation() {
    double x = game.screenSize.width / 2.5 - game.tileSize;
    double y = (game.screenSize.height / 3);
    targetLocation = Offset(x, y);
  }

  void onTapDownIncease() {
    knightIndex = 0;
    walk = true;
    jump = false;
    running = false;
    walkBack = false;
    speed = 15;
  }

  void onTapDownDecrease() {
    jump = false;
    running = false;
    walk = false;
    walkBack = false;
  }

  void onRun() {
    knightIndex = 0;
    walk = false;
    running = true;
    speed = 20;
    jump = false;
    walkBack = false;
  }

  void onJump() {
    knightIndex = 0;
    jump = true;
    running = false;
    walk = false;
    speed = 4;
    walkBack = false;
  }
}
