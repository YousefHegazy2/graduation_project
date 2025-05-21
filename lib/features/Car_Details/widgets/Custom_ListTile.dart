import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({super.key, required this.image1, required this.image2, required this.title1, required this.subTitle1, required this.title2, required this.subTitle2});
  final String image1;
  final String image2;
  final String title1;
  final String subTitle1;
  final String title2;
  final String subTitle2;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(image1),
      title: Text(
        title1,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      subtitle: Text(
        subTitle1,
        style: TextStyle(color: kPrimaryColorGrey, fontSize: 13),
      ),
      trailing: SizedBox(
        width: 140,
        child: Row(
          children: [
            Image.asset(image2),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(title2,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(
                  subTitle2,
                  style: TextStyle(color: kPrimaryColorGrey, fontSize: 13),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
