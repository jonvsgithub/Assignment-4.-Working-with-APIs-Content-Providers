import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  get themeData => _themeData;

  void toggleTheme() {
    if (_themeData.brightness == Brightness.dark) {
      _themeData = ThemeData.light();
    } else {
      _themeData = ThemeData.dark();
    }
    notifyListeners();
  }
}
