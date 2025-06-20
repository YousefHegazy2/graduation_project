import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/CustomAppBar.dart';
import 'package:rentora_app/cores/widgets/Custom_Category_Textfield.dart';
import 'package:rentora_app/features/dashboard/views/Dashboard.dart';
import 'package:rentora_app/features/shopping/widgets/productCard.dart';
import 'package:rentora_app/shared/global_lists.dart';


class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allProducts = [
      ...travels.map((item) => {
        "image": item.image,
        "name": item.name,
        "location": item.location,
        "price": item.price.toStringAsFixed(2),
      }),
      ...electronics.map((item) => {
        "image": item.image,
        "name": item.name,
        "location": item.location,
        "price": item.price.toStringAsFixed(2),
      }),
      ...sports.map((item) => {
        "image": item.image,
        "name": item.name,
        "location": item.location,
        "price": item.price.toStringAsFixed(2),
      }),
      ...transportations.map((item) => {
        "image": item.image,
        "name": item.name,
        "location": item.location,
        "price": item.price.toStringAsFixed(2),
      }),
    ];

    // Add default cards if the list is empty
    if (allProducts.isEmpty) {
      allProducts.addAll([
        {
          "image": 'assets/images/tent2.jpeg',
          "name": 'Tent',
          "location": 'Nasr City, Cairo',
          "price": '25.00',
          //"isMemoryImage": false,
        },
        {
          "image": 'assets/images/tennis.jpeg',
          "name": 'Tennis',
          "location": 'Nasr city',
          "price": '160.00',
          //"isMemoryImage": false,
        },
      ]);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        icon1: Icon(Icons.arrow_back, size: 26, color: const Color.fromARGB(255, 248, 248, 248)),
        icon2: Icon(Icons.shopping_cart, size: 24, color: kPrimaryColorBlue),
        onPressedIcon1: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return MainHomeScreen();
          }));
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
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) {
                    final product = allProducts[index];
                    return ProductCard(
                      image: product["image"]!,
                      itemName: product["name"]!,
                      location: product["location"]!,
                      price: product["price"]!,
                      isMemoryImage: product["image"] != null && product["image"].toString().startsWith('assets/') ? false : true,
                      onAddPressed: () {
                        print("${product["name"]} added to cart");
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
