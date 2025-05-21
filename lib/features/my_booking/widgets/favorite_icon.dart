import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;
  double cardScale = 1.0;
  double favIconScale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            favIconScale = 1.3;
          });
        },
        onExit: (_) {
          setState(() {
            favIconScale = 1.0; 
          });
        },
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 1.0, end: favIconScale),
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
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                  size: 24,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
