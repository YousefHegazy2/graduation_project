import 'package:flutter/material.dart';
import 'package:rentora_app/features/Rental_Partner/widgets/Working_Hours.dart';

class PartnerAbout extends StatelessWidget {
  const PartnerAbout({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing dolor sit amet, consectetur adipiscing elit sit amet, consectetur adipiscing '),
            SizedBox(
              height: 15,
            ),
            Text(
              'Working Hours',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(
              color: const Color.fromARGB(255, 214, 214, 214),
              thickness: 3,
            ),
            WorkingHours(text1: 'Saturday', text2: '00:00-00:00'),
            SizedBox(
              height: 11,
            ),
            WorkingHours(text1: 'Sunday', text2: '00:00-00:00'),
            SizedBox(
              height: 11,
            ),
            WorkingHours(text1: 'Monday', text2: '00:00-00:00'),
            SizedBox(
              height: 11,
            ),
            WorkingHours(text1: 'Tuesday', text2: '00:00-00:00'),
            SizedBox(
              height: 11,
            ),
            WorkingHours(text1: 'Wednesday', text2: '00:00-00:00'),
            SizedBox(
              height: 11,
            ),
            WorkingHours(text1: 'Thursday', text2: '00:00-00:00'),
            SizedBox(
              height: 11,
            ),
            WorkingHours(text1: 'Friday', text2: '00:00-00:00'),
          ],
        ),
      ),
    );
  }
}
