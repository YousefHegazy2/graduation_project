import 'package:flutter/material.dart';

class LeftTopImage extends StatelessWidget {
  const LeftTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        child: Container(
          width: 181,
          height: 165,
          child: Image.asset(
            'assets/images/top screen design.png',
            fit: BoxFit.fill,
          ),
        ));
  }
}
