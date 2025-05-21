import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class Buildbutton extends StatelessWidget {
  final VoidCallback? onpressed;

  Buildbutton({super.key, this.onpressed}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: onpressed,
          style: ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kPrimaryColorBlue),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  padding: MaterialStateProperty.all(
    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
  ),
),

          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
