import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapContainer extends StatelessWidget {
  final double height;
  final double width;
  final LatLng center;

  const MapContainer({
    Key? key,
    this.height = 200.0,
    this.width = double.infinity,
    required this.center, // تمرير إحداثيات مركز الخريطة
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FlutterMap(
          options: MapOptions(
            center: center,
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
                  point: center,
                  builder: (ctx) => Icon(
                    Icons.location_on,
                    color: const Color.fromARGB(255, 57, 84, 235),
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
