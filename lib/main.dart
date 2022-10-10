import 'package:flutter/material.dart';
import 'package:thanghoang/pages/myHomePage.dart';
import 'package:thanghoang/themes/custom_theme.dart';

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
      theme: CustomTheme.darkTheme,
      home: const MyHomePage(title: 'Thanghoang'),
    );
  }
}


