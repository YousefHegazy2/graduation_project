import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColorBlue,
        padding:const EdgeInsets.symmetric(horizontal: 48,vertical: 8)
      ),
      onPressed: (){}, 
      child:const Text('Continue',
      style: TextStyle(
        color: kPrimaryColorWhite,
        fontSize: 19
      ),
      ));
  }
}