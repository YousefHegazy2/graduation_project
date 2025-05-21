import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text1});
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style:const TextStyle(fontSize: 18),
    );
  }
}
