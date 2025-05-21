import 'package:flutter/material.dart';

class CustomArrowBack extends StatelessWidget {
  CustomArrowBack({super.key,required this.color});
  Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: color,
          size: 27,
        ));
  }
}
