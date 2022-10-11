
import 'package:flutter/material.dart';
import 'package:thanghoang/widgets/custom_appbar.dart';
import 'package:thanghoang/widgets/custom_cart.dart';
import 'package:thanghoang/widgets/custom_textfield.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          CustomTextFiled(),
          CustomCard(),
        ],
      ),
    );
  }
}