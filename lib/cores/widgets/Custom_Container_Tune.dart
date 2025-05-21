import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomContainerTune extends StatelessWidget {
  const CustomContainerTune({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kPrimaryColorWhite,
                ),
                height: 52,
                width: 52,
                child:const Icon(Icons.tune,
                color: kPrimaryColorBlue,
                ),
              );
  }
}