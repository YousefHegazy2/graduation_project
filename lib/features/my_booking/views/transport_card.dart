import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/my_booking/widgets/card_button.dart';
import 'package:rentora_app/features/my_booking/widgets/favorite_icon.dart';

class TransportCard extends StatelessWidget {
  const TransportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //       ************   the category image and icons Row
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/car2.jpeg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 8,
                  left: 8,
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      Text("4.9",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                FavoriteIcon(),
              ],
            ),

            SizedBox(height: 8),

            //         *************   the category and price row
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transport",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$25.00 /day",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 4),

            //      **************    the name and availability
            const Row(
              children: [
                Text(
                  "Hyundai Verna",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(flex: 1),
                Text(
                  "Available",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 8),

            //    ***************    the row of the details about the category
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.settings, size: 18, color: Colors.blue),
                    SizedBox(width: 4),
                    Text("Manual", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.local_gas_station, size: 18, color: Colors.blue),
                    SizedBox(width: 4),
                    Text("Petrol", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.event_seat, size: 18, color: Colors.blue),
                    SizedBox(width: 4),
                    Text("2 seats", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 12),

            //   ************    the Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(flex: 1),
                CardButton(
                    text: 'Re-Book',
                    backgroundcolor: Colors.white.withOpacity(0.9),
                    textcolor: kPrimaryColorBlue),
                Spacer(flex: 1),
                const CardButton(
                  text: 'Add Review',
                  backgroundcolor: kPrimaryColorBlue,
                  textcolor: kPrimaryColorWhite,
                ),
                Spacer(flex: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
