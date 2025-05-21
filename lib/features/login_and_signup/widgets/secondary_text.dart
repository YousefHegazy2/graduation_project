import 'package:flutter/material.dart';

class SecondaryText extends StatelessWidget {
  const SecondaryText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
