
import 'package:flutter/material.dart';
import 'package:thanghoang/styles/colors.dart';

class CustomCard extends StatefulWidget{
  const CustomCard({super.key});

  @override
  State<StatefulWidget> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.fromLTRB(45.0,30,45.0,30),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child:
            Text(
              'HCMC, VN',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 40,
                color: borderColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child:
            Text(
              'Tuesday 10-10-2022',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: borderColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Image.asset(
            'images/ic_weather.png',
            width: 300,
            height: 300,
          ),
          const Text(
            '29˚C',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 85,
              color: borderColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Clouds',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              color: borderColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Hight: 34˚C / Low: 24˚C',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: borderColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}