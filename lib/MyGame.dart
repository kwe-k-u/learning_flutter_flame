

import 'dart:ui';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class MyGame extends Game{
  static const int squareSpeed = 400;
  late Rect squarePos;
  int squareDirection = 1;
  static final squarePaint = BasicPalette.white.paint();


  @override
  Color backgroundColor() {
    return Colors.teal.shade100;
  }

  @override
  Future<void> onLoad() async {
    squarePos = Rect.fromLTWH(0, 0, 100, 100);
  }


  @override
  void render(Canvas canvas) {
    canvas.drawRect(squarePos, squarePaint);

  }

  @override
  void update(double dt) {
    squarePos = squarePos.translate(squareSpeed * squareDirection * dt, squareSpeed * squareDirection * dt);

    // This simple condition verifies if the square is going right, and has reached the end of the
    // screen and if so, we invert the direction.
    //
    // Note here that we have used the variable size, which is a variable provided
    // by the Game class which contains the size in logical pixels that the game is currently using.
    if (squareDirection == 1 && squarePos.right > size.x) {
      squareDirection = -1;
      // This does the same, but now checking the left direction
    } else if (squareDirection == -1 && squarePos.left < 0) {
      squareDirection = 1;
    }
  }

}

