import 'package:flutter/material.dart';

class BannerCard extends StatefulWidget {
  final String imageUrl;

  const BannerCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _BannerCardState createState() => _BannerCardState();
}

class _BannerCardState extends State<BannerCard> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _scale = 1.05),
        onExit: (_) => setState(() => _scale = 1.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..translate((1 - _scale) * MediaQuery.of(context).size.width / 2,
                (1 - _scale) * 170 / 2)
            ..scale(_scale),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              widget.imageUrl,
              width: double.infinity,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
