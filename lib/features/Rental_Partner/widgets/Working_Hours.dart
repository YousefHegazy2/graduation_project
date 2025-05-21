import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class WorkingHours extends StatelessWidget {
  const WorkingHours({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1,style: TextStyle(color: kPrimaryColorGrey),),
        Text(text2,style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}