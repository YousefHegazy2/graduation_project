import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Car_Details/widgets/Custom_Account_ListTile.dart';
import 'package:rentora_app/features/Car_Details/widgets/Custom_Positioned.dart';

class TabReview extends StatelessWidget {
  const TabReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 130),
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child:const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Review',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Icon(
                              Icons.edit,
                              color: kPrimaryColorBlue,
                            ),
                            Text(
                              'Add Review',
                              style: TextStyle(
                                  color: kPrimaryColorBlue, fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          cursorColor: kPrimaryColorBlue,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: kPrimaryColorWhite,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 8),
                              hintText: 'Add Comment',
                              hintStyle: TextStyle(fontSize: 14),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kPrimaryColorWhite)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kPrimaryColorWhite))),
                        )
                      ],
                    ),
                  ),
                ),
                const CustomAccountListtile(
                    image: 'assets/images/picture.png',
                    title: 'Deanna Botsford V',
                    subTitle: 'Amazing',
                    trailing: '11 month ago'),
               const CustomAccountListtile(
                    image: 'assets/images/Oval.png',
                    title: 'Deanna Botsford V',
                    subTitle: 'Perfect',
                    trailing: '2 month ago'),
               const CustomAccountListtile(
                    image: 'assets/images/picture.png',
                    title: 'Deanna Botsford V',
                    subTitle: 'Beautiful',
                    trailing: '2 hour ago')
              ],
            ),
          ),
        ),
       const CustomPositioned()
      ],
    );
  }
}
