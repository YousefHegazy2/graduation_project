import 'package:flutter/material.dart';

class GoogleIcon extends StatelessWidget {
  const GoogleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const InkWell(
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white,
        child: Image(
          image: AssetImage('assets/images/google.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
