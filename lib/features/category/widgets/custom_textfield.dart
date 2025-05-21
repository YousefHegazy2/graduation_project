import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.edgeInsetsGeometry});
  final EdgeInsetsGeometry edgeInsetsGeometry;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColorGrey,
      decoration: InputDecoration(
        contentPadding: edgeInsetsGeometry,
          filled: true,
          fillColor: kPrimaryColorPhoto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColorGrey))),
    );
  }
}
