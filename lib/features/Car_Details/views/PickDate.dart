import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Arrow_Back.dart';
import 'package:rentora_app/features/Car_Details/containers/mapConatiner.dart';
import 'package:rentora_app/features/Car_Details/containers/pickContainer.dart';
import 'package:rentora_app/features/Car_Details/views/SummaryPage.dart';
import 'package:rentora_app/features/Car_Details/widgets/buildButton.dart';

class PickUpPage extends StatelessWidget {
  PickUpPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> isClick = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildCarDetailsSection(),
          const SizedBox(height: 16),
          PickUpSection(),
          const SizedBox(height: 16),
          _buildLocationSection(),
          const SizedBox(height: 16),
          Buildbutton(onpressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SummaryPage(),
                ),
              );
          },),
           const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 220,
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: kPrimaryColorWhite,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 16,
            child: CustomArrowBack(color: kPrimaryColorWhite),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/car.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarDetailsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'SUV',
                style: TextStyle(color: kPrimaryColorBlue, fontSize: 14),
              ),
              Spacer(),
              Icon(Icons.star, color: Colors.amber),
              Text('4.9'),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Toyota Fortuner Legender',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey.shade200,
            thickness: 2,
            indent: 18,
            endIndent: 18,
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              'Location of the Item',
              style: TextStyle(fontFamily: "Nunito", fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          MapContainer(
            height: 300,
            center: LatLng(30.0444, 31.2357),
          ),
        ],
      ),
    );
  }
}
