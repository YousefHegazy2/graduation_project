import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Arrow_Back.dart';
import 'package:rentora_app/cores/widgets/Custom_Drodown.dart';
import 'package:rentora_app/features/category/widgets/Container_Image.dart';
import 'package:rentora_app/features/category/widgets/Custom_Button.dart';
import 'package:rentora_app/features/category/widgets/Custom_Container_Car.dart';
import 'package:rentora_app/features/category/widgets/Custom_Row_Textfield.dart';
import 'package:rentora_app/features/category/widgets/Custom_Text.dart';
import 'package:rentora_app/features/category/widgets/custom_textfield.dart';

class TransportationPage extends StatelessWidget {
  const TransportationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 140,
          backgroundColor: kPrimaryColorBlue,
          leading: CustomArrowBack(color: kPrimaryColorWhite),
          title: const ContainerImage(images: 'assets/images/car(1) 1.png')),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainerCar(),
            SizedBox(
              height: 17,
            ),
            CustomText(
              text1: 'Name',
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextfield(
              edgeInsetsGeometry:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            ),
            SizedBox(
              height: 17,
            ),
            CustomText(text1: 'Transmission'),
            SizedBox(
              height: 8,
            ),
            CustomRowTextfield(),
            SizedBox(
              height: 17,
            ),
            CustomText(
              text1: 'Body Type',
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextfield(
              edgeInsetsGeometry:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            ),
            SizedBox(
              height: 17,
            ),
            CustomText(
              text1: 'Fuel Type',
            ),
            SizedBox(
              height: 8,
            ),
            CustomDrodown(
              text1: 'Gasoline 90',
              text2: 'Gasoline 92',
              text5: '',
            ),
            SizedBox(
              height: 17,
            ),
            CustomText(
              text1: 'Description',
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextfield(
                edgeInsetsGeometry:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 38)),
            SizedBox(
              height: 17,
            ),
            CustomText(
              text1: 'Location',
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextfield(
                edgeInsetsGeometry:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 12)),
            SizedBox(
              height: 17,
            ),
            CustomText(
              text1: 'Price/day',
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextfield(
                edgeInsetsGeometry:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 12)),
            SizedBox(
              height: 17,
            ),
            Center(child: CustomButton())
          ],
        ),
      )),
    );
  }
}
