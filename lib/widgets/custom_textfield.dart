
import 'package:flutter/material.dart';
import 'package:thanghoang/styles/colors.dart';
import 'package:thanghoang/styles/style.dart';

class CustomTextFiled extends StatefulWidget{
  const CustomTextFiled({super.key});

  @override
  State<StatefulWidget> createState()  => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled>{

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.fromLTRB(45.0,0,45.0,5),
      child:  Stack(
        children: [
          Container(
            height: 55,
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40),),
              boxShadow: [
                BoxShadow(color: shadowColor, blurRadius: 7, spreadRadius: 7),
              ],
            ),
          ),
          SizedBox(
            child: TextFormField(
              cursorColor: backgroundColor,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Input zip code here',
                hintStyle: const TextStyle(fontSize: 17, color: backgroundColor),
                filled: true,
                fillColor: borderColor,
                isDense: true,                      // Added this
                contentPadding: const EdgeInsets.all(17),  // Added this
                enabledBorder: myOutlineInputBorder(),
                focusedBorder: myOutlineInputBorder(),
                border: myOutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}