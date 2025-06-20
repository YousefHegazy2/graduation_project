import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Notifications/widgets/noti_category.dart';
import 'package:rentora_app/features/dashboard/views/Dashboard.dart';


class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, String>> orders = [
    {
      'imageUrl': 'assets/images/tent2.jpeg',
      'title': 'Tent',
      'description': 'Fishing Equipment',
      'date': '12/11/1024 - 20/11/2024',
    },
    {
      'imageUrl': 'assets/images/car2.jpeg',
      'title': 'Toyota',
      'description': 'Lantern',
      'date': '12/11/1024 - 20/11/2024',
    },
    {
      'imageUrl': 'assets/images/golf.jpeg',
      'title': 'golf tools',
      'description': 'safe tools with provided helmet',
      'date': '12/11/1024 - 20/11/2024',
    },
    {
      'imageUrl': 'assets/images/tennis.jpeg',
      'title': 'tennis tools',
      'description': 'safe tools with provided helmet',
      'date': '12/11/1024 - 20/11/2024',
    },
  ];

  void _removeOrder(int index) {
    setState(() {
      orders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A73E9),
      body: DecoratedBox(
      decoration:    BoxDecoration(
      gradient: KPrimaryMix2, // التدرج اللوني هنا
    ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
            return MainHomeScreen();
          }));
                    }, icon: Icon(Icons.arrow_back , size:26 ,color: Colors.white,)),
                    Padding(
                      padding: const EdgeInsets.only(left: 85),
                      child: Text(
                        "My Notifications",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: orders.isEmpty
                      ? Center(
                          child: Text(
                            "No notification available",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return NotificationCard(
                              imageUrl: orders[index]['imageUrl']!,
                              title: orders[index]['title']!,
                              description: orders[index]['description']!,
                              date: orders[index]['date']!,
                              onMarkAsRead: () {
                                print(
                                    'Accepted ${orders[index]['title']} Booking');
                              },
                              onDismiss: () {
                                _removeOrder(index);
                              },
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
