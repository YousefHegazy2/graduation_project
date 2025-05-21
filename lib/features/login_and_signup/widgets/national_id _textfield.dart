import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class NationalIdTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hinttext;
  String? labeltext;
  bool obscureText = false;
  Icon? sufixicon;

  NationalIdTextField({
    super.key,
    this.hinttext,
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
        controller: controller,
        keyboardType: TextInputType.number, // Allow only numbers
        maxLength: 14, // Restrict input to 14 characters
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: TextStyle(color: Colors.grey),
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey),
          counterText: "", // Hide the character counter
          filled: true,
          fillColor: kPrimaryColorPhoto,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: PorderRadiusColor),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: PorderRadiusColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "National ID is required";
          }
          if (value.length != 14) {
            return "National ID must be 14 digits";
          }
          if (!RegExp(r'^[0-9]{14}$').hasMatch(value)) {
            return "National ID must contain only numbers";
          }
          return null; // Return null if the input is valid
        },
      ),
    );
  }
}
