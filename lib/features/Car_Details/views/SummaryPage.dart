import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Arrow_Back.dart';
import 'package:rentora_app/features/Car_Details/containers/paymentCards.dart';
import 'package:rentora_app/features/Car_Details/widgets/buildButton.dart';

class SummaryPage extends StatelessWidget {
  final int pricePerDay = 20;
  final int totalDays = 5;

  @override
  Widget build(BuildContext context) {
    int totalAmount = pricePerDay * totalDays;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CustomArrowBack(color: Colors.blue,),
        ),
        title: Text(
          'Review Summary',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 620,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  _buildCarSummaryCard('assets/images/car.png',
                      'Toyota Fortuner Legender', pricePerDay),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    indent: 18,
                    endIndent: 18,
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildDetailRow('Booking start', 'October 04 | 10:00 AM'),
                  _buildDetailRow('Returning Time', 'October 05 | 10:00 AM'),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    indent: 18,
                    endIndent: 18,
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildDetailRow('Amount', '\$$pricePerDay / day'),
                  _buildDetailRow('Total days', '$totalDays day(s)'),
                  SizedBox(
                    height: 20,
                  ),
                  _buildDetailRow('Total', '\$$totalAmount', isTotal: true),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    indent: 18,
                    endIndent: 18,
                    height: 20,
                  ),
                  _buildPaymentMethod(context),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    indent: 18,
                    endIndent: 18,
                    height: 20,
                  )
                ],
              ),
            ),
            Buildbutton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCarSummaryCard(String image, String itemName, int price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SUV',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '4.9',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                itemName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$$price per Day',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(FontAwesomeIcons.moneyCheckDollar, color: kPrimaryColorBlue, size:26 ,),
              SizedBox(width: 25),
              Text(
                'Card',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              showPaymentMethodSheet(context);
            },
            child: Text(
              'Change',
              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
