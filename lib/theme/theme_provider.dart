import 'package:flutter/material.dart';
import 'package:sneakershop/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeMode = lightmode;

  ThemeData get themeMode => _themeMode;

  set themeMode(ThemeData mode) {
    _themeMode = mode;
    notifyListeners();
  }
  
  void toggleTheme() {
    _themeMode = _themeMode == lightmode ? darkmode : lightmode;
    notifyListeners();
  }
}