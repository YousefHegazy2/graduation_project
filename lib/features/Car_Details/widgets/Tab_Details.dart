import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Car_Details/widgets/Custom_ListTile.dart';
import 'package:rentora_app/features/Car_Details/widgets/Custom_Positioned.dart';

class TabDetails extends StatelessWidget {
  const TabDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(
                  'Details',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset('assets/images/gas-station 1.png'),
                  title: Text(
                    'Fuel',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  subtitle: Text(
                    'Petrol',
                    style: TextStyle(color: kPrimaryColorGrey, fontSize: 13),
                  ),
                  trailing: SizedBox(
                    width: 140,
                    child: Row(
                      children: [
                        Image.asset('assets/images/Vector.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Air Conditioning',
                          style:
                              TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                CustomListtile(
                  image1: 'assets/images/transport 1.png',
                  title1: 'Status',
                  subTitle1: 'new',
                  image2: 'assets/images/Vector (1).png',
                  title2: 'Acceleration',
                  subTitle2: '0-100km/ms',
                ),
                CustomListtile(
                  image1: 'assets/images/car-engine 1.png',
                  title1: 'Engine',
                  subTitle1: 'CC 1998',
                  image2: 'assets/images/manual-transmission 1.png',
                  title2: 'Transmission',
                  subTitle2: 'manual',
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
