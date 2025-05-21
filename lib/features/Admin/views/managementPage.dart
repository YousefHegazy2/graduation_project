import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/CustomAppBar.dart';
import 'package:rentora_app/cores/widgets/Custom_Category_Textfield.dart';
import 'package:rentora_app/features/Admin/widgets/managementWidget.dart'; 
class ManagementPage extends StatelessWidget {
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
 
    final List<Map<String, String>> accounts = [
      {
        'imageUrl': 'assets/images/profile.jpeg',
        'title': 'Amged Elsayed',
        'subtitle': 'amged@example.com'
      },
      {
        'imageUrl': 'assets/images/profile.jpeg',
        'title': 'Youssef Smith',
        'subtitle': 'jooo@example.com'
      },
      {
        'imageUrl': 'assets/images/profile.jpeg',
        'title': 'Moustafa Johnson',
        'subtitle': 'desha@example.com'
      },
      {
        'imageUrl': 'assets/images/profile.jpeg',
        'title': 'Fawzi De silva',
        'subtitle': 'fawzi@example.com'
      },
      {
        'imageUrl': 'assets/images/profile.jpeg',
        'title': 'Arabi Kishk',
        'subtitle': 'araby@example.com'
      },
      
      
    ];

    return Scaffold(
      appBar: CustomAppBar(
        icon1: Icon(
          Icons.arrow_back,
          size: 26,
          color: const Color.fromARGB(255, 248, 248, 248),
        ),
        icon2: Icon(
          Icons.manage_accounts,
          size: 24,
          color: kPrimaryColorBlue,
        ),
        onPressedIcon1: () {
          Navigator.pop(context);
        },
        title: CustomCategoryTextfield(
          text: "Search for accounts",
        ),
      ),
      body: ListView.builder(
        itemCount: accounts.length, 
        itemBuilder: (context, index) {
         
          var account = accounts[index];
          return ManagementWidget(
            imageUrl: account['imageUrl']!,
            title: account['title']!,
            subtitle: account['subtitle']!,
          );
        },
      ),
    );
  }
}
