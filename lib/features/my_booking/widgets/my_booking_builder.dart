import 'package:flutter/material.dart';
import 'package:rentora_app/features/my_booking/views/transport_card.dart';

class MyBookingBuilder extends StatelessWidget {
  const MyBookingBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return TransportCard();
      },
    );
  }
}
