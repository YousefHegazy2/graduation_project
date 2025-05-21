import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Home/views/HomePage.dart';
import 'package:rentora_app/features/dashboard/views/DrawerPage.dart';
import 'package:rentora_app/features/favourites/views/favouriePage.dart';
import 'package:rentora_app/features/Notifications/views/NotificationPage.dart';
import 'package:rentora_app/features/shopping/views/MapScreen.dart';
import 'package:rentora_app/features/shopping/views/ProductsPage.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;

  final List<Widget> widgetOptions = [
    FavoritePage(),
    NotificationPage(),
    ProductsPage(),
    MapScreen(),
  ];

  final List<IconData> iconList = [
    Icons.favorite,
    Icons.notifications,
    Icons.shopping_cart,
    Icons.explore,
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex =
          index + 1; 
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      drawer: AppDrawer(),
      body:
          _selectedIndex == 0 ? Homepage() : widgetOptions[_selectedIndex - 1],
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColorBlue,
        onPressed: () {
          setState(() {
            _selectedIndex = 0; 
          });
        },
        child: Icon(Icons.home, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        iconSize: 30,
        icons: iconList,
        activeIndex: _selectedIndex == 0
            ? -1
            : _selectedIndex - 1, 
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeColor: kPrimaryColorBlue,
        inactiveColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
