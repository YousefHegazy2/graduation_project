import 'package:flutter/material.dart';

class ProductModel {
  final String imageUrl;
  final String itemName;
  final String location;
  final String price;
  final VoidCallback onFavoritePressed;

  ProductModel(
      {required this.imageUrl,
      required this.itemName,
      required this.location,
      required this.price,
      required this.onFavoritePressed});

  factory ProductModel.fromjson(data) {
    return ProductModel(
      imageUrl: data[''],
      itemName: data[''],
      location: data[''],
      price: data[''],
      onFavoritePressed: data[''],
    );
  }
}
