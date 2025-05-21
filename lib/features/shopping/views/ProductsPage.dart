import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/CustomAppBar.dart';
import 'package:rentora_app/cores/widgets/Custom_Category_Textfield.dart';
import 'package:rentora_app/features/shopping/widgets/productCard.dart';


class ProductsPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      "imageUrl": "assets/images/rent1.png",
      "itemName": "BMW-2-gran-c...",
      "location": "Nasr City, Cairo",
      "price": "\$25.00 /day"
    },
    {
      "imageUrl": "assets/images/rent2.png",
      "itemName": "Motorcycle",
      "location": "Nasr City, Cairo",
      "price": "\$25.00 /day"
    },
    {
      "imageUrl": "assets/images/rent3.png",
      "itemName": "Electric Bike",
      "location": "Nasr City, Cairo",
      "price": "\$25.00 /day"
    },
    {
      "imageUrl": "assets/images/rent4.png",
      "itemName": "Pickup Truck",
      "location": "Nasr City, Cairo",
      "price": "\$25.00 /day"
    },
    {
      "imageUrl": "assets/images/rent1.png",
      "itemName": "BMW-2-gran-c...",
      "location": "Nasr City, Cairo",
      "price": "\$25.00 /day"
    },
    {
      "imageUrl": "assets/images/rent2.png",
      "itemName": "Motorcycle",
      "location": "Nasr City, Cairo",
      "price": "\$25.00 /day"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        icon1: Icon(Icons.arrow_back, size: 26, color: const Color.fromARGB(255, 248, 248, 248)),
        icon2: Icon(Icons.shopping_cart, size: 24, color: kPrimaryColorBlue),
        onPressedIcon1: () {
       
        },
        onPressedIcon2: () {
          print("Shopping Cart Clicked");
        }, title: CustomCategoryTextfield(text: "search",),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10), // إضافة هامش خارجي
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.72, 
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      imageUrl: products[index]["imageUrl"]!,
                      itemName: products[index]["itemName"]!,
                      location: products[index]["location"]!,
                      price: products[index]["price"]!,
                      onAddPressed: () {
                        print("${products[index]["itemName"]} added to cart");
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
