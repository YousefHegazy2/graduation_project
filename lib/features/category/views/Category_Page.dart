import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Category_Textfield.dart';
import 'package:rentora_app/cores/widgets/Custom_Container_Tune.dart';
import 'package:rentora_app/features/category/Models/Travel_Model.dart';
import 'package:rentora_app/features/category/views/Electronics_Page.dart';
import 'package:rentora_app/features/category/views/Sports_Page.dart';
import 'package:rentora_app/features/category/views/Transportation_Page.dart';
import 'package:rentora_app/features/category/views/Travels_Page.dart';
import 'package:rentora_app/features/category/widgets/custom_row_category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorWhite,
      appBar: AppBar(
        toolbarHeight: 140,
        backgroundColor: kPrimaryColorBlue,
        title: const CustomCategoryTextfield(text: 'search your categories',),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 8), child: CustomContainerTune())
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomRowCategory(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return TravelsPage();
                }),
              );
              if (result != null && result is TravelModel) {
                Navigator.pop(context, result);
              }
            },
            image: 'assets/images/travel-bag(1) 1.png',
            text: 'Travels',
          ),
          const SizedBox(
            height: 25,
          ),
          CustomRowCategory(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return TransportationPage();
                }),
              );
              if (result != null) {
                Navigator.pop(context, result);
              }
            },
            image: 'assets/images/car(1) 1.png',
            text: 'Transportation',
          ),
          const SizedBox(
            height: 25,
          ),
          CustomRowCategory(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SportsPage();
                }),
              );
              if (result != null) {
                Navigator.pop(context, result);
              }
            },
            image: 'assets/images/gym 1.png',
            text: 'Sports',
          ),
          const SizedBox(
            height: 25,
          ),
          CustomRowCategory(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ElectronicsPage();
                }),
              );
              if (result != null) {
                Navigator.pop(context, result);
              }
            },
            image: 'assets/images/gadget 1.png',
            text: 'Electronics',
          ),
        ],
      ),
    );
  }
}
