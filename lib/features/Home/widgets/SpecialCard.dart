import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Car_Details/views/Details.dart';
import 'dart:convert';


class SpecialCard extends StatefulWidget {
  final String imageUrl;
  final String itemName;
  final String location;
  final String price;
  final VoidCallback onFavoritePressed;
  final bool isMemoryImage;

  const SpecialCard({
    Key? key,
    required this.imageUrl,
    required this.itemName,
    required this.location,
    required this.price,
    required this.onFavoritePressed,
    this.isMemoryImage = false,
  }) : super(key: key);

  @override
  _SpecialCardState createState() => _SpecialCardState();
}

class _SpecialCardState extends State<SpecialCard> {
  bool isFavorite = false;
  bool isHovered = false;
  bool isIconHovered = false; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(),
            ),
          );
        },
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedScale(
            scale: isHovered ? 1.1 : 1.0, 
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              width: 160,
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
               
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: widget.isMemoryImage
                            ? Image.memory(
                                base64Decode(widget.imageUrl),
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.imageUrl,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.itemName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                Text(
                                  "4.9",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey, size: 16),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                widget.location,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Available",
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                        SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.price,
                              style: TextStyle(
                                color: kPrimaryColorBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            MouseRegion(
                              onEnter: (_) =>
                                  setState(() => isIconHovered = true),
                              onExit: (_) =>
                                  setState(() => isIconHovered = false),
                              child: AnimatedScale(
                                scale: isIconHovered
                                    ? 1.3
                                    : 1.0, // تكبير الأيقونة عند التحويم
                                duration: Duration(milliseconds: 150),
                                curve: Curves.easeInOut,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                    widget.onFavoritePressed();
                                  },
                                  child: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.blue,
                                    size: 26,
                                  ),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
