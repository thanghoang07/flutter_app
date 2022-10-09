import 'package:flutter/material.dart';
import 'package:thanghoang/pages/myHomePage.dart';
import 'package:thanghoang/themes/custom_theme.dart';
import 'package:thanghoang/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


