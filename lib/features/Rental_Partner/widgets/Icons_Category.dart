import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class IconsCategory extends StatelessWidget {
  const IconsCategory({super.key, required this.onTap, required this.icon, required this.text1, required this.text2, required this.size});
  final Function() onTap;
  final IconData icon;
  final String text1;
  final String text2;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: Icon(
              icon,
              size: size,
              color: kPrimaryColorBlue,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text1,
          style: TextStyle(color: kPrimaryColorBlue, fontSize: 19),
        ),
        Text(
          text2,
          style: TextStyle(color: kPrimaryColorGrey, fontSize: 15),
        ),
      ],
    );
  }
}
