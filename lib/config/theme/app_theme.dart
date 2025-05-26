import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
      primary: Colors.deepPurple,
      secondary: Colors.deepPurpleAccent,
      tertiary: Colors.deepPurple.shade300,
    ),
  );
}
