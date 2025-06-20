import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Arrow_Back.dart';

class CustomContainerDetails extends StatefulWidget {
  const CustomContainerDetails({super.key});

  @override
  State<CustomContainerDetails> createState() => _CustomContainerDetailsState();
}

class _CustomContainerDetailsState extends State<CustomContainerDetails> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: double.infinity,
      color: kPrimaryColorWhite,
      child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          Row(
            children: [
               CustomArrowBack(color: Colors.blue,),
              const SizedBox(
                width: 90,
              ),
              const Text(
                'Car Details',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 35,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    size: 27,
                    color: kPrimaryColorBlue,
                  )),
              const SizedBox(
                width: 23,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isClick = !isClick;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 29,
                    color: isClick ? kPrimaryColorBlue : const Color.fromARGB(255, 190, 190, 190),
                  )),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Image.asset('assets/images/car.png')
        ],
      ),
    );
  }
}
