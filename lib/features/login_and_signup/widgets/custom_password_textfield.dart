import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

// ignore: must_be_immutable
class CustomPasswordTextfield extends StatelessWidget {
  final String hinttext;
 final String? labeltext;
 final bool obscureText ;
 final Icon? sufixicon;
  final TextEditingController controller;

 const CustomPasswordTextfield({
    super.key,
    required this.hinttext,
    this.labeltext,
    this.obscureText = false,
    this.sufixicon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        textAlign: TextAlign.start,
        
        controller: controller,
        obscureText: obscureText,
        obscuringCharacter: '*',
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.grey,),
          labelText: labeltext,
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: kPrimaryColorPhoto,
          suffixIcon: sufixicon,
      
          // enabledBorder
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: PorderRadiusColor),
            borderRadius: BorderRadius.circular(10),
          ),
          // focusedBorder
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: PorderRadiusColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
