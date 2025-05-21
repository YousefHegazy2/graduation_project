import 'package:flutter/material.dart';
import 'package:rentora_app/cores/widgets/Custom_Drodown.dart';

class CustomRowDropdown extends StatelessWidget {
  const CustomRowDropdown(
      {super.key, required this.text3, required this.text4});
  final String text3;
  final String text4;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: Row(
        children: [
          Expanded(
              child: CustomDrodown(
            text1: text3,
            text2: text4,
            text5: text3,
          )),
          const SizedBox(width: 30),
          Expanded(
              child: CustomDrodown(
            text1: text4,
            text2: text3,
            text5: text4,
          )),
        ],
      ),
    );
  }
}
