import 'package:flutter/material.dart';

getLightTheme() {
  return ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      error: Colors.red,
      primary: Colors.deepPurple,
      secondary: Colors.pink,
      tertiary: Colors.teal,
      surface: Colors.white,
      onPrimary: Colors.deepPurple,
      onSecondary: Colors.pinkAccent,
      brightness: Brightness.light,
      onError: Colors.red,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(229, 219, 255, 0),
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Color.fromRGBO(187, 173, 240, 1),
    ),
  );
}

getDarkTheme() {
  return ThemeData(
    backgroundColor: Colors.white,
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(232, 227, 254, 1),
      selectedItemColor: Colors.white,
    ),
  );
}
