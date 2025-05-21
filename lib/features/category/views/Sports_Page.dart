import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Arrow_Back.dart';
import 'package:rentora_app/features/category/widgets/Container_Image.dart';
import 'package:rentora_app/features/category/widgets/Container_Photo.dart';
import 'package:rentora_app/features/category/widgets/Custom_Button.dart';
import 'package:rentora_app/features/category/widgets/Custom_Double_Textfield.dart';
import 'package:rentora_app/features/category/widgets/Custom_Text.dart';
import 'package:rentora_app/features/category/widgets/custom_textfield.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 140,
          backgroundColor: kPrimaryColorBlue,
          leading: CustomArrowBack(color: kPrimaryColorWhite),
          title: const ContainerImage(images: 'assets/images/gym 1.png')),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerPhoto(),
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
              edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
            ),
            SizedBox(
              height: 17,
            ),
            CustomText(text1: 'Condition'),
            SizedBox(
              height: 8,
            ),
            CustomDoubleTextfield(
              text6: 'used',
              text7: 'New',
              text8: 'Used',
            ),
            SizedBox(
              height: 17,
            ),
            CustomText(
              text1: 'Amount',
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextfield(
              edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
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
                edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 8,vertical: 38)),
            SizedBox(
              height: 17,
            ),
            CustomText(text1: 'Condition'),
            SizedBox(
              height: 8,
            ),
            CustomDoubleTextfield(
              text6: '1 Year',
              text7: '2 Year',
              text8: 'Levels',
            ),
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
                edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 8,vertical: 12)),
            SizedBox(
              height: 17,
            ),
            CustomText(
              text1: 'Price',
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextfield(
                edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 8,vertical: 12)),
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
