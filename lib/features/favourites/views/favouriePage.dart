import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/CustomAppBar.dart';
import 'package:rentora_app/cores/widgets/Custom_Category_Textfield.dart';
import 'package:rentora_app/features/Home/widgets/SpecialCard.dart';
import 'package:rentora_app/features/dashboard/views/Dashboard.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Map<String, String>> favoriteItems = [];

  void addToFavorites(
      String imageUrl, String itemName, String location, String price) {
    setState(() {
      favoriteItems.add({
        'imageUrl': imageUrl,
        'itemName': itemName,
        'location': location,
        'price': price,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon1: Icon(Icons.arrow_back,
            size: 26, color: const Color.fromARGB(255, 248, 248, 248)),
        icon2: Icon(Icons.favorite, size: 24, color: kPrimaryColorBlue),
        onPressedIcon1: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return MainHomeScreen();
          }));
        },
       
        title:  Text(
          "Favorites",
          style: TextStyle(
              color: Colors.white, fontFamily: 'Nunito', fontSize: 30),
        ),
      ),
      body: favoriteItems.isEmpty
          ? Center(
              child: Text(
                "No favorites yet!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                return SpecialCard(
                  imageUrl: favoriteItems[index]['imageUrl']!,
                  itemName: favoriteItems[index]['itemName']!,
                  location: favoriteItems[index]['location']!,
                  price: favoriteItems[index]['price']!,
                  onFavoritePressed: () {
                    setState(() {
                      favoriteItems.removeAt(index);
                    });
                  },
                );
              },
            ),
    );
  }
}
