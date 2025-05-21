import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Arrow_Back.dart';
import 'package:rentora_app/features/my_booking/widgets/my_booking_builder.dart';


class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomArrowBack(
          color: kPrimaryColorBlue,
        ),
        title: const Text('My Booking'),
        centerTitle: true,
      ),
      body: const DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Text('completed'),
                Text('cancelled'),
              ],
              indicatorColor: kPrimaryColorBlue,
              labelColor: kPrimaryColorBlue,
            ),
            Expanded(
              child: TabBarView(children: [
                MyBookingBuilder(),
                MyBookingBuilder(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
