import 'package:flutter/material.dart';
import 'package:flutterlol/utils/constants.dart';

class Settings extends ChangeNotifier {
  ThemeData _themeData = Constants.darkTheme;

  void themeToggle() {
    if (_themeData == Constants.darkTheme) {
      _themeData = Constants.lightTheme;
    } else {
      _themeData = Constants.darkTheme;
    }
    notifyListeners();
  }

  set themeData (ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  get themeData {
    return _themeData;
  }
}