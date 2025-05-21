import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage({super.key, required this.images});
  final String images;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: kPrimaryColorWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kPrimaryColorBlue, width: 2.5)),
      child: Center(
        child: Image.asset(
          images,
          width: 170,
          height: 170,
        ),
      ),
    );
  }
}
