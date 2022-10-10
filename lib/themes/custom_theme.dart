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
        brightness: Brightness.dark,
        primaryColor: const Color.fromRGBO(56, 62, 72, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(235, 235, 230, 1),
        textTheme: ThemeData
            .dark()
            .textTheme,
        );
  }
}
  extension PriceColor on ThemeData{
    Color get priceColor {
     return const Color.fromRGBO(220, 212, 201, 1);
    }
  }