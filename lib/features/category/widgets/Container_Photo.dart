import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class ContainerPhoto extends StatelessWidget {
  const ContainerPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kPrimaryColorPhoto, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.camera_alt,
            color: kPrimaryColorBlue,
            size: 38,
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Add Photo',
                style: TextStyle(color: kPrimaryColorBlue, fontSize: 18),
              ))
        ],
      ),
    );
  }
}
