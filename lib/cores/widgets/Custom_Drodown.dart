import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomDrodown extends StatelessWidget {
  const CustomDrodown(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text5});
  final String text1;
  final String text2;
  final String text5;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          filled: true,
          fillColor: kPrimaryColorPhoto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColorGrey))),
      items: [
        DropdownMenuItem(
          value: text1,
          child: Text(text1),
        ),
        DropdownMenuItem(value: text2, child: Text(text2))
      ],
      onChanged: (value) {
        print("Condition: $value");
      },
      hint: Text(text5),
    );
  }
}
