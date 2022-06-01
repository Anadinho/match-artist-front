import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButton = Color(0xff00056b);
  Color _activeSecondButton = Color(0xffb3e5fc);
  Color _blueColorPrimary = Color(0xff0288d1);
  Color _blueColorSecond = Color(0xff00056b);
  List<Color> _getBackGround = [Color(0xff00056b), Color(0xff0288d1)];

  Color getActivePrimaryButton() {
    return _activePrimaryButton;
  }

  Color getActiveSecondButton() {
    return _activeSecondButton;
  }

  Color getBlueColorPrimary() {
    return _blueColorPrimary;
  }

  Color getBlueColorSecond() {
    return _blueColorSecond;
  }

  List<Color> getBackGround() {
    return _getBackGround;
  }
}
