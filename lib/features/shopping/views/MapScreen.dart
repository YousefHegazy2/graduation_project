import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Category_Textfield.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: KPrimaryMix2),
        ),
        elevation: 0,
        bottom: PreferredSize(preferredSize: Size(20, 20), child: Text('')),
        title: CustomCategoryTextfield(text: '  search a location',onpressed: () {
          
        },),
        
       
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(30.0444, 31.2357), 
          zoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(30.0444, 31.2357),
                builder: (ctx) => Icon(
                  Icons.location_on,
                  color: kPrimaryColorBlue,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
