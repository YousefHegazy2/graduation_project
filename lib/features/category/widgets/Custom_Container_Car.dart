import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomContainerCar extends StatelessWidget {
  const CustomContainerCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kPrimaryColorPhoto, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kPrimaryColorWhite
              ),
              child: Image.asset('assets/images/image 5.png'),
            ),
            const SizedBox(width: 8,),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kPrimaryColorWhite,
                border: Border.all(
                  color: kPrimaryColorBlue,
                  width: 1
                )
              ),
              child:const Icon(Icons.add,size: 26,),
            ),
          ],
        ),
      ),
    );
  }
}
