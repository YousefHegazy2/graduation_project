import 'package:flutter/material.dart';
import 'package:rentora_app/cores/widgets/Custom_Drodown.dart';
import 'package:rentora_app/features/category/widgets/custom_textfield.dart';

class CustomDoubleTextfield extends StatelessWidget {
  const CustomDoubleTextfield({super.key, required this.text6, required this.text7, required this.text8});
  final String text6;
  final String text7;
  final String text8;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: Row(
        children: [
         const Expanded(
            child: CustomTextfield(
              edgeInsetsGeometry: EdgeInsets.symmetric(
                horizontal: 8,vertical: 12
              ),
            )
          ),
          const SizedBox(width: 20),
          Expanded(
            child: CustomDrodown(text1: text6,text2: text7,text5: text8,)
          ),
        ],
      ),
    );
  }
}