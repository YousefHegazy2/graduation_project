import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Icon? icon1;
  final Icon ?icon2;
  final VoidCallback ?onPressedIcon1;
  final VoidCallback ?onPressedIcon2;
  final Widget title;
  const CustomAppBar({
    Key? key,
     this.icon1,
     this.icon2,
     this.onPressedIcon1,
     this.onPressedIcon2, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3D9FEA),
              Color.fromARGB(255, 9, 37, 114)
            ], // Gradient Colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.only(top: 20),
        child: AppBar(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: title,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              
              icon: icon1!,
              onPressed: onPressedIcon1,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22,
                child: IconButton(
                  icon: icon2!,
                  onPressed: onPressedIcon2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 120);
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);

    /// Creates a smooth wave curve at the bottom
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height - 40);
    path.quadraticBezierTo(
        size.width * 0.75, size.height - 80, size.width, size.height - 70);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
