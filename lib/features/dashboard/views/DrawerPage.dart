import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Admin/views/managementPage.dart';
import 'package:rentora_app/features/Admin/views/viewOnly.dart';
import 'package:rentora_app/features/dashboard/widgets/drawerList.dart';
import 'package:rentora_app/features/favourites/views/favouriePage.dart';
import 'package:rentora_app/features/my_booking/views/my_booking_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(gradient: KPrimaryMix2),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(gradient: KPrimaryMix2),
              accountName: Text(
                "Welcome Amged!",
                style: TextStyle(
                    fontSize: 22, color: Colors.white, fontFamily: 'Nunito'),
              ),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                radius: 42,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 38,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
              ),
            ),
            DrawerListTile(
              icon: Icons.home,
              text: "Home Page",
              onTap: () => Navigator.pop(context),
            ),
            DrawerListTile(
              icon: Icons.description,
              text: "Preview",
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewOnly(),
                  ),
                );
              },
            ),
            DrawerListTile(
              icon: Icons.edit,
              text: "Edit Profile",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManagementPage(),
                  ),
                );
              },
            ),
            DrawerListTile(
              icon: Icons.library_books,
              text: "My Booking",
              onTap: () {
                Navigator.pop(context); // اغلق الـ Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBookingScreen(),
                  ),
                );
              },
            ),
            DrawerListTile(
              icon: Icons.favorite,
              text: "Favorite",
              onTap: () {
                Navigator.pop(context); // اغلق الـ Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(),
                  ),
                );
              },
            ),
            DrawerListTile(
              icon: Icons.logout,
              text: "Log Out",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
