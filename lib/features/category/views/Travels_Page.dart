import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Arrow_Back.dart';
import 'package:rentora_app/features/category/Models/Travel_Model.dart';
import 'package:rentora_app/features/category/widgets/Container_Image.dart';
import 'package:rentora_app/features/category/widgets/Custom_Text.dart';

class TravelsPage extends StatefulWidget {
  const TravelsPage({super.key});

  @override
  State<TravelsPage> createState() => _TravelsPageState();
}

class _TravelsPageState extends State<TravelsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  String condition = 'Used';
  String? imageBase64;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() {
        imageBase64 = base64Encode(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 140,
          backgroundColor: kPrimaryColorBlue,
          leading: CustomArrowBack(
            color: Colors.blue,
          ),
          title: const ContainerImage(
              images: 'assets/images/travel-bag(1) 1.png')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kPrimaryColorPhoto, borderRadius: BorderRadius.circular(12)),
                child: imageBase64 == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.camera_alt, color: kPrimaryColorBlue, size: 38),
                          SizedBox(height: 15),
                          Text('Add Photo', style: TextStyle(color: kPrimaryColorBlue, fontSize: 18)),
                        ],
                      )
                    : Image.memory(base64Decode(imageBase64!), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 17),
            const CustomText(text1: 'Name'),
            const SizedBox(height: 8),
            TextField(controller: nameController, decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12), filled: true, fillColor: kPrimaryColorPhoto, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColorGrey)))),
            const SizedBox(height: 17),
            const CustomText(text1: 'Condition'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: condition,
              items: ['Used', 'New'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => condition = val!),
            ),
            const SizedBox(height: 17),
            const CustomText(text1: 'Amount'),
            const SizedBox(height: 8),
            TextField(controller: amountController, keyboardType: TextInputType.number, decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12), filled: true, fillColor: kPrimaryColorPhoto, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColorGrey)))),
            const SizedBox(height: 17),
            const CustomText(text1: 'Description'),
            const SizedBox(height: 8),
            TextField(controller: descriptionController, maxLines: 3, decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 38), filled: true, fillColor: kPrimaryColorPhoto, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColorGrey)))),
            const SizedBox(height: 17),
            const CustomText(text1: 'Location'),
            const SizedBox(height: 8),
            TextField(controller: locationController, decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12), filled: true, fillColor: kPrimaryColorPhoto, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColorGrey)))),
            const SizedBox(height: 17),
            const CustomText(text1: 'Price'),
            const SizedBox(height: 8),
            TextField(controller: priceController, keyboardType: TextInputType.number, decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12), filled: true, fillColor: kPrimaryColorPhoto, border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColorGrey)))),
            const SizedBox(height: 17),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColorBlue, padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8)),
                onPressed: () {
                  if (nameController.text.isEmpty || amountController.text.isEmpty || descriptionController.text.isEmpty || locationController.text.isEmpty || priceController.text.isEmpty || imageBase64 == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all fields and add a photo.')));
                    return;
                  }
                  final travel = TravelModel(
                    name: nameController.text,
                    condition: condition,
                    amount: int.tryParse(amountController.text) ?? 1,
                    description: descriptionController.text,
                    location: locationController.text,
                    price: double.tryParse(priceController.text) ?? 0.0,
                    image: imageBase64!,
                  );
                  Navigator.pop(context, travel);
                },
                child: const Text('Continue', style: TextStyle(color: kPrimaryColorWhite, fontSize: 19)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
