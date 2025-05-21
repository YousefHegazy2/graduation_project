import 'package:flutter/material.dart';

class CategoryIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const CategoryIcon({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  _CategoryIconState createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: MouseRegion(
        onEnter: (_) => setState(() => _scale = 1.2),
        onExit: (_) => setState(() => _scale = 1.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){},
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFF1A73E9),
                  child: Icon(widget.icon, color: Colors.white, size: 30),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
