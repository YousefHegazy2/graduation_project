import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonName;
  final VoidCallback onpressed;
  double fontsize = 20;

  CustomButton(
      {required this.buttonName,
      required this.onpressed,
      this.fontsize = 20,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Set width
      height: 45, // Set height
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1A73E8), // Set button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Set border radius
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontsize,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    );
  }
}
