import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomCategoryTextfield extends StatelessWidget {
  const CustomCategoryTextfield({super.key, this.text , this.onpressed});
  final String? text;
  final VoidCallback ?onpressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 26,
            ),
            onPressed: onpressed,
          ),
          suffixIconColor: kPrimaryColorBlue,
          
          filled: true,
          fillColor: kPrimaryColorWhite,
          hintText: '$text ...',
          hintStyle: const TextStyle(color: kPrimaryColorGrey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}
