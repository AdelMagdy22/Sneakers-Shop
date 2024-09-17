// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey[300],
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade800,
    onBackground: Colors.grey.shade800,
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade400,
    onBackground: Colors.grey.shade300,
  ),
);