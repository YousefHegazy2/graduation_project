import 'package:flutter/material.dart';
import 'package:rentora_app/features/category/widgets/Container_Image.dart';
class CustomRowCategory extends StatelessWidget {
  const CustomRowCategory({super.key, required this.image, required this.text, this.onTap});
  final String image;
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ContainerImage(images: image)
          ),
           Padding(
            padding:const EdgeInsets.only(left: 16),
            child: Text(
              text,
              style:const TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
