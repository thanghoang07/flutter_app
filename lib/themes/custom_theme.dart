import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: ButtonThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            buttonColor: Colors.orange));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            buttonColor: Colors.pinkAccent));
  }
}