import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    this.hinttext,
    this.labeltext,
    this.obscureText = false,
    this.sufixicon,
    required this.controller, this.validator,
  });

  final String? hinttext;
  String? labeltext;
  bool obscureText = false;
  Icon? sufixicon;
  final TextEditingController controller;
final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
     validator: validator,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.grey),
          labelText: labeltext,
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: kPrimaryColorPhoto,
          suffixIcon: sufixicon,

          // enabledBorder
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: PorderRadiusColor),
            borderRadius: BorderRadius.circular(8),
          ),
          // focusedBorder
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: PorderRadiusColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
