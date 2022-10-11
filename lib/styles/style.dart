import 'package:flutter/material.dart';
import 'package:thanghoang/styles/colors.dart';

OutlineInputBorder myOutlineInputBorder(){
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(80),),
    borderSide: BorderSide(width: 4, color: borderColor),
    gapPadding: 8,
  );
}