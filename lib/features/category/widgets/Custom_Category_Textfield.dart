import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomCategoryTextfield extends StatelessWidget {
  const CustomCategoryTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
            decoration: InputDecoration(
              prefixIcon:const Icon(Icons.search,size: 30,),
              prefixIconColor:kPrimaryColorBlue,
              filled: true,
              fillColor: kPrimaryColorWhite,
              hintText: 'Search your categories...',
              hintStyle:const TextStyle(
                color: kPrimaryColorGrey
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              )
              ),
          );
  }
}