import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_sharp,
          color: Colors.blue,
          size: 35,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
