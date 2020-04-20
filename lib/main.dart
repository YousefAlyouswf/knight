import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  flameUtil.setOrientation(DeviceOrientation.landscapeLeft);
  flameUtil.fullScreen();

  Flame.audio.disableLog();
  Flame.audio.loadAll(<String>[]);
  Flame.images.loadAll(<String>[
    'PNG/City1/Pale/boxes&container.png',
    'PNG/City1/Pale/buildings.png',
    'PNG/City1/Pale/City1.png',
    'PNG/City1/Pale/road&border.png',
    'PNG/City1/Pale/sky.png',
    'PNG/City1/Pale/wall1.png',
    'PNG/City1/Pale/wall2.png',
    'PNG/City1/Pale/wheels&hydrant.png',
    'Knight/Walk/walk1.png',
    'Knight/Walk/walk2.png',
    'Knight/Walk/walk3.png',
    'Knight/Walk/walk4.png',
    'Knight/Walk/walk5.png',
    'Knight/Walk/walk6.png',
    'Knight/Run/run1.png',
    'Knight/Run/run2.png',
    'Knight/Run/run3.png',
    'Knight/Run/run4.png',
    'Knight/Run/run5.png',
    'Knight/Run/run6.png',
    'Knight/Run/run7.png',
    'Knight/Run/run8.png',
    'Knight/Jump/jump1.png',
    'Knight/Jump/jump2.png',
    'Knight/Jump/jump3.png',
    'Knight/Jump/jump4.png',
    'Knight/Jump/jump5.png',
    'Knight/Jump/jump6.png',
    'Knight/Jump/jump7.png',
    'Knight/knight.png',
  ]);
  GameController game = GameController();
  runApp(game.widget);

  // PanGestureRecognizer  tapper=PanGestureRecognizer () ;
  // tapper.onUpdate = game.onVerticalDragDown;
  // flameUtil.addGestureRecognizer(tapper);
}
