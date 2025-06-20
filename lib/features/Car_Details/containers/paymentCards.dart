import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showPaymentMethodSheet(BuildContext context) {
  showBarModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose Payment Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.paypal, color: Colors.blue),
                title: Text('Paypal',style: TextStyle( fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                  showCreditCardForm(context);
                },
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.ccVisa, color: Colors.green),
                title: Text('Credit Card',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                  showCreditCardForm(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showCreditCardForm(BuildContext context) {
  showBarModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, top: 16),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Enter Card Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Divider(),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: FaIcon(FontAwesomeIcons.solidCreditCard, size: 20),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Expiry Date (MM/YY)',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: FaIcon(FontAwesomeIcons.calendarAlt, size: 20),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10 ,top: 10),
                      child: FaIcon(FontAwesomeIcons.lock, size: 20),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Payment Successful')),
                    );
                  },
                  child: const Text(
                    'Pay Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      );
    },
  );
}
