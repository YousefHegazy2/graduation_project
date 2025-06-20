import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomArrowBack extends StatelessWidget {
  final Color color;

  const CustomArrowBack({super.key, required this.color});

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
