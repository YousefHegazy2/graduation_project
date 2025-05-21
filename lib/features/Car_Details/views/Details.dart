import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Car_Details/widgets/Custom_Container_Details.dart';
import 'package:rentora_app/features/Car_Details/widgets/Tab_About.dart';
import 'package:rentora_app/features/Car_Details/widgets/Tab_Details.dart';
import 'package:rentora_app/features/Car_Details/widgets/Tab_Review.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isClick = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomContainerDetails(),
          Container(
          height: 130,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Rate',
                      style: TextStyle(color: kPrimaryColorBlue),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isClick = !isClick;
                          });
                        },
                        icon: Icon(
                          Icons.star,
                          color: isClick ? Colors.amber : const Color.fromARGB(255, 190, 190, 190),
                        )),
                    Text('4.9')
                  ],
                ),
                Text(
                  'Toyota Fortuner Legender',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TabBar(
                    controller: tabController,
                    labelColor: kPrimaryColorBlue,
                    indicator: UnderlineTabIndicator(
                      insets: EdgeInsets.symmetric(horizontal: 52),
                      borderSide: BorderSide(color: kPrimaryColorBlue, width: 3),
                    ),
                    labelPadding: EdgeInsets.only(bottom: 8),
                    tabs: [
                      Text(
                        'About',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Review',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]
                  ),
              ],
            ),
          ),
        ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
              TabAbout(),
              TabDetails(),
              TabReview(),
            ]),
          )
        ],
      ),
    );
  }
}