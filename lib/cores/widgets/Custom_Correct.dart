import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomCorrect extends StatefulWidget {
  const CustomCorrect({super.key});

  @override
  State<CustomCorrect> createState() => _CustomCorrectState();
}

class _CustomCorrectState extends State<CustomCorrect> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isCheck = !isCheck;
            });
          },
          child: Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
                color: kPrimaryColorPhoto,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kPrimaryColorGrey)),
            child: isCheck ?const Icon(Icons.check) : null,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const Text(
          'Negotiable',
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
