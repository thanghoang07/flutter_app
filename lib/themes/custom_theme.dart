import 'package:flutter/material.dart';
import 'package:thanghoang/styles/colors.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: primaryColorThemeLight,
        scaffoldBackgroundColor: borderColor,
        buttonTheme: ButtonThemeData(
            splashColor: transparentColor,
            highlightColor: transparentColor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            buttonColor: orangeColor));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: ThemeData
            .dark()
            .textTheme,
        );
  }
}