import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Car_Details/views/Details.dart';
import 'dart:convert';

class ProductCard extends StatefulWidget {
  final String image;
  final String itemName;
  final String location;
  final String price;
  final VoidCallback onAddPressed;
  final bool isMemoryImage;

  const ProductCard({
    Key? key,
    required this.image,
    required this.itemName,
    required this.location,
    required this.price,
    required this.onAddPressed,
    this.isMemoryImage = false,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  double cardScale = 1.0; 
  double favIconScale = 1.0; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(),
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            cardScale = 1.05; 
          });
        },
        onExit: (_) {
          setState(() {
            cardScale = 1.0; 
          });
        },
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 1.0, end: cardScale),
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 140,
                  height: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 2),
                      )
                    ],
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: widget.isMemoryImage
                              ? Image.memory(
                                  base64Decode(widget.image),
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  widget.image,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.itemName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 2),
                            Text(
                              widget.location,
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Available",
                              style: TextStyle(color: Colors.green, fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.price,
                                    style: TextStyle(
                                      color: kPrimaryColorBlue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                IconButton(
                                  onPressed: widget.onAddPressed,
                                  icon: Icon(Icons.add_box, size: 20, color: kPrimaryColorBlue),
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
