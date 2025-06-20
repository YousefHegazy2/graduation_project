import 'package:flutter/material.dart';
import 'package:rentora_app/features/category/widgets/custom_textfield.dart';
class CustomRowTextfield extends StatelessWidget {
  const CustomRowTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 75),
      child: Row(
        children: [
          Expanded(
            child: CustomTextfield(edgeInsetsGeometry: EdgeInsets.symmetric(
              vertical: 12,horizontal: 8
            )),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: CustomTextfield(edgeInsetsGeometry: EdgeInsets.symmetric(
              vertical: 12,horizontal: 8
            )),
          ),
        ],
      ),
    );
  }
}