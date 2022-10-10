import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:thanghoang/business/models/todo_list_model.dart';
import 'package:thanghoang/resources/pages/myHomePage.dart';
import 'package:thanghoang/resources/themes/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w400),
          subtitle1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Hind',
          ),
        ),
      ),
      home: MyHomePage(title: ''),
    );

    return ScopedModel<TodoListModel>(
      model: TodoListModel(),
      child: app,
    );
  }
}


