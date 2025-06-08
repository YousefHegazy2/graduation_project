import 'package:flutter/material.dart';

class LeftTopImage extends StatelessWidget {
  const LeftTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        child: SizedBox(
          width: 160,
          height: 150,
          child: Image.asset(
            'assets/images/top screen design.png',
            fit: BoxFit.fill,
          ),
        ));
  }
}
