import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/cores/widgets/Custom_Arrow_Back.dart';
import 'package:rentora_app/features/Rental_Partner/widgets/Icons_Category.dart';
import 'package:rentora_app/features/Rental_Partner/widgets/Partner_About.dart';
import 'package:rentora_app/features/my_booking/widgets/my_booking_builder.dart';

class RentalPartner extends StatefulWidget {
  const RentalPartner({super.key});

  @override
  State<RentalPartner> createState() => _RentalPartnerState();
}

class _RentalPartnerState extends State<RentalPartner>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomArrowBack(color: kPrimaryColorWhite),
                Text(
                  'Rental Partner',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      size: 27,
                      color: kPrimaryColorBlue,
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset('assets/images/Oval.png'),
              title: Text(
                'Jenny Doe',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Owner',
                    style: TextStyle(color: kPrimaryColorGrey, fontSize: 13),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.locationDot,
                        color: kPrimaryColorBlue,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Downtwon, Cairo',
                        style: TextStyle(color: kPrimaryColorGrey),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: const Color.fromARGB(255, 214, 214, 214),
              thickness: 3,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconsCategory(
                  onTap: () {},
                  icon: FontAwesomeIcons.userFriends,
                  text1: '4500+',
                  text2: 'Customer',
                  size: 18,
                ),
                IconsCategory(
                  onTap: () {},
                  icon: FontAwesomeIcons.shoppingBag,
                  text1: '15+',
                  text2: 'Equipment',
                  size: 21,
                ),
                IconsCategory(
                  onTap: () {},
                  icon: Icons.grade,
                  text1: '4.9+',
                  text2: 'Rating',
                  size: 24,
                ),
                IconsCategory(
                  onTap: () {},
                  icon: Icons.chat,
                  text1: '4,956',
                  text2: 'Review',
                  size: 21,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            TabBar(
                controller: tabController,
                labelColor: kPrimaryColorBlue,
                indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.symmetric(horizontal: 60),
                  borderSide: BorderSide(color: kPrimaryColorBlue, width: 3),
                ),
                labelPadding: EdgeInsets.only(bottom: 8),
                tabs: [
                  Text(
                    'About',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Equipment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  PartnerAbout(),
                  MyBookingBuilder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
