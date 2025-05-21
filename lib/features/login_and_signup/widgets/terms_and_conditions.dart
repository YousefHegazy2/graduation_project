import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: kPrimaryColorBlue,
          value: true,
          onChanged: (value) {
            value = false;
          },
        ),
        const Text(
          'Agree with ',
          style: TextStyle(fontSize: 15),
        ),
        InkWell(
          child: const Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
          onTap: () {},
        )
      ],
    );
  }
}
