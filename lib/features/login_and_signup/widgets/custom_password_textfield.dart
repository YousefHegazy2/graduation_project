import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomPasswordTextfield extends StatelessWidget {
  final String hinttext;
  String? labeltext;
  bool obscureText = false;
  Icon? sufixicon;
  final TextEditingController controller;

  CustomPasswordTextfield({
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
      height: 45,
      child: TextFormField(
        obscureText: obscureText,
        obscuringCharacter: '*',
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
          labelText: labeltext,
          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: kPrimaryColorPhoto,
          suffixIcon: sufixicon,

          // enabledBorder
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: PorderRadiusColor),
            borderRadius: BorderRadius.circular(8),
          ),
          // focusedBorder
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: PorderRadiusColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
