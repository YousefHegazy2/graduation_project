import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomAccountListtile extends StatelessWidget {
  const CustomAccountListtile({super.key, required this.image, required this.title, required this.subTitle, required this.trailing});
  final String image;
  final String title;
  final String subTitle;
  final String trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(color: kPrimaryColorGrey, fontSize: 13),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
