import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Car_Details/views/PickDate.dart';

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        left: 0,
        bottom: 0,
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            color: Color.fromARGB(255, 241, 241, 241),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Slider(
                    inactiveColor: kPrimaryColorPhoto,
                    activeColor: kPrimaryColorBlue,
                    value: 1,
                    //min: 1,
                    // max: 12,
                    onChanged: (value) {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Day",
                        style:
                            TextStyle(fontSize: 13, color: Colors.grey[700])),
                    Text("Year",
                        style:
                            TextStyle(fontSize: 13, color: Colors.grey[700])),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price'),
                        Row(
                          children: [
                            Text(
                              '\$25.00',
                              style: TextStyle(color: kPrimaryColorBlue),
                            ),
                            Text('/month')
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColorBlue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 6)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PickUpPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Book Now',
                          style: TextStyle(
                              color: kPrimaryColorWhite, fontSize: 18),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
