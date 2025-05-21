import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Car_Details/views/Details.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String itemName;
  final String location;
  final String price;
  final VoidCallback onAddPressed;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.itemName,
    required this.location,
    required this.price,
    required this.onAddPressed,
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
                  height: 220,
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
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.asset(
                              widget.imageUrl,
                              width: double.infinity,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  favIconScale =
                                      1.3; 
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  favIconScale =
                                      1.0; 
                                });
                              },
                              child: TweenAnimationBuilder(
                                tween:
                                    Tween<double>(begin: 1.0, end: favIconScale),
                                duration: Duration(milliseconds: 150),
                                curve: Curves.easeInOut,
                                builder: (context, double value, child) {
                                  return Transform.scale(
                                    scale: value,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isFavorite = !isFavorite;
                                        });
                                      },
                                      child: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color:
                                            isFavorite ? kPrimaryColorBlue : Colors.grey,
                                        size: 24,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.itemName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.location,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 3),
                              Text(
                                "Available",
                                style:
                                    TextStyle(color: Colors.green, fontSize: 14),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.price,
                                    style: TextStyle(
                                      color: kPrimaryColorBlue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      
                                      child: IconButton(onPressed: () {  }, icon: Icon(Icons.add_box , size: 28,color: kPrimaryColorBlue,),
                                     
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
