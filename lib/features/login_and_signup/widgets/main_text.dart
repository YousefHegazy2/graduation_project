import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText(
      {super.key,
      required this.text,
      required this.fontsize,
      required this.color,
      });

  final String text;
  final double fontsize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Nunito',
      ),
    );
  }
}
