import 'package:flutter/material.dart';
import 'package:thanghoang/themes/custom_theme.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState()  => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Text(
        widget.title,
        style: const TextStyle(
            color: Colors.transparent,
        ),
      ),
    );
  }
}