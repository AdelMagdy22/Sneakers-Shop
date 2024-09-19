import 'package:flutter/material.dart';
import 'package:sneakershop/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  // initially, the theme mode is light
  ThemeData _themeMode = lightmode;

  // getter for the theme mode
  ThemeData get themeMode => _themeMode;

  // check if the theme mode is dark
  bool get isDarkMode => _themeMode == darkmode;

  // set the theme mode
  set themeMode(ThemeData mode) {
    _themeMode = mode;
    notifyListeners();
  }

  // toggle the theme mode
  void toggleTheme() {
    _themeMode = _themeMode == lightmode ? darkmode : lightmode;
    notifyListeners();
  }
}