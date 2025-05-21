import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Car_Details/widgets/Custom_Positioned.dart';

class TabAbout extends StatelessWidget {
  const TabAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 12, bottom: 110),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rent Partner',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset('assets/images/Oval.png'),
                      title: Text(
                        'Jenny Doe',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      subtitle: Text(
                        'Owner',
                        style: TextStyle(color: kPrimaryColorGrey),
                      ),
                      trailing: SizedBox(
                        width: 110,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.chat,
                                  color: kPrimaryColorBlue,
                                  size: 27,
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone,
                                  color: kPrimaryColorBlue,
                                  size: 27,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'About',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur \n adipiscing dolor sit amet, consectetur adipiscing elit.',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        CustomPositioned()
      ],
    );
  }
}