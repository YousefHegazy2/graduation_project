import 'package:flutter/material.dart';

void showPaymentMethodSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Paypal'),
              onTap: () {
                Navigator.pop(context);
                _showCreditCardForm(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Credit Card'),
              onTap: () {
                Navigator.pop(context);
                _showCreditCardForm(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

void _showCreditCardForm(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, top: 16),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
           
            children: [
               TextField(
                decoration: InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                keyboardType: TextInputType.datetime,
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'CVV'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),),
               
                child: TextButton(
                  
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Payment Successful')));
                  },
                  child: Text(
                    'Pay Now',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
               SizedBox(height: 15),
            ],
          ),
        ),
      );
    },
  );
}
