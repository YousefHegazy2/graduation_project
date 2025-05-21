import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Arrow_Back.dart';
import 'package:rentora_app/features/category/widgets/Container_Image.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 140,
      backgroundColor: kPrimaryColorBlue,
      leading: CustomArrowBack(
        color: kPrimaryColorWhite,
      ),
      title: const ContainerImage(images: 'assets/images/travel-bag(1) 1.png'),
    );
  }
}
