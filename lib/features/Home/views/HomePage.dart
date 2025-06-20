import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:rentora_app/constant.dart';
import 'package:rentora_app/features/Home/widgets/BannerCard.dart';
import 'package:rentora_app/features/Home/widgets/CategoryIcon.dart';
import 'package:rentora_app/features/Home/widgets/SpecialCard.dart';
import 'package:rentora_app/features/Home/widgets/popularCard.dart';
import 'package:rentora_app/features/category/Models/Electronic_Model.dart';
import 'package:rentora_app/features/category/Models/Travel_Model.dart';
import 'package:rentora_app/features/category/views/Category_Page.dart';
import 'package:rentora_app/features/dashboard/views/DrawerPage.dart';
import 'package:rentora_app/features/category/Models/Sport_Model.dart';
import 'package:rentora_app/features/category/Models/Transportation_Model.dart';
import 'package:rentora_app/shared/global_lists.dart';


class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: KPrimaryMix2
          ),
        ),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.drag_indicator, color: Colors.white, size: 30),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white, size: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
        
      ),
      body: DraggableHome(
        title: Text(
          "",
          
        ),
        appBarColor: Colors.white,
        headerWidget: _buildHeader(),
        body: [
          
          _buildBody(context),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is TravelModel) {
      if (!travels.contains(args)) {
        setState(() {
          travels.add(args);
        });
      }
    }
  }

  Widget _buildHeader() {
    return Container(
      height: 170,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: const [
          BannerCard(imageUrl: "assets/images/banner1.jpg"),
          BannerCard(imageUrl: "assets/images/banner2.jpg"),
          BannerCard(imageUrl: "assets/images/banner3.jpg"),
          BannerCard(imageUrl: "assets/images/banner4.jpg"),
          BannerCard(imageUrl: "assets/images/banner5.jpg"),
          BannerCard(imageUrl: "assets/images/banner6.jpg"),
    
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle("Categories", () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(),
              ),
            );
            if (result != null && result is TravelModel) {
              setState(() {
                travels.add(result);
              });
            }
            if (result != null && result is ElectronicModel) {
              setState(() {
                electronics.add(result);
              });
            }
            if (result != null && result is SportModel) {
              setState(() {
                sports.add(result);
              });
            }
            if (result != null && result is TransportationModel) {
              setState(() {
                transportations.add(result);
              });
            }
          }),
            SizedBox(height: 10),
           _CategoryList(),
          _SectionTitle("Nearest For You",(){}),
          SizedBox(height: 10),
          _AllCardsList(),
          _SectionTitle("Popular", (){}),
          SizedBox(height: 10),
          _PopularCardList(),
        ],
      ),
    );
  }

  Widget _SectionTitle(String title , VoidCallback ?ontap) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
           fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(flex: 1,),
        TextButton(
          onPressed: ontap,
          child: const Text(
            'see all',
            style: TextStyle(
             fontFamily: 'Nunito',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kPrimaryColorBlue,
          )),
        ),
      ],
    );
  }

  Widget _CategoryList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CategoryIcon(
                icon: Icons.travel_explore, label: "Travels", onTap: () {}),
            CategoryIcon(
                icon: Icons.directions_car, label: "Transports", onTap: () {}),
            CategoryIcon(
                icon: Icons.sports_football, label: "Sports", onTap: () {}),
            CategoryIcon(
                icon: Icons.devices, label: "Electronics", onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _AllCardsList() {
    final allCards = [
      ...travels.map((travel) => SpecialCard(
        imageUrl: travel.image,
        itemName: travel.name,
        location: travel.location,
        price: '${travel.price.toStringAsFixed(2)}',
        onFavoritePressed: () {},
        isMemoryImage: true,
      )),
      ...electronics.map((electronic) => SpecialCard(
        imageUrl: electronic.image,
        itemName: electronic.name,
        location: electronic.location,
        price: '${electronic.price.toStringAsFixed(2)}',
        onFavoritePressed: () {},
        isMemoryImage: true,
      )),
      ...sports.map((sport) => SpecialCard(
        imageUrl: sport.image,
        itemName: sport.name,
        location: sport.location,
        price: '${sport.price.toStringAsFixed(2)}',
        onFavoritePressed: () {},
        isMemoryImage: true,
      )),
      ...transportations.map((trans) => SpecialCard(
        imageUrl: trans.image,
        itemName: trans.name,
        location: trans.location,
        price: '${trans.price.toStringAsFixed(2)}',
        onFavoritePressed: () {},
        isMemoryImage: true,
      )),
      SpecialCard(
          imageUrl: 'assets/images/tent2.jpeg',
          itemName: 'Tent',
          location: 'Nasr City, Cairo',
          price: '\$25.00',
          onFavoritePressed: () {}),
      SpecialCard(
          imageUrl: 'assets/images/tennis.jpeg',
          itemName: 'Tennis',
          location: 'Nasr city',
          price: '\$160.00',
          onFavoritePressed: () {}),
    ];
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: allCards.map((card) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: card,
          )).toList(),
        ),
      ),
    );
  }

  Widget _PopularCardList() {
    return const Column(
      children: [
        PopularCard(
            imageUrl: 'assets/images/tent1.jpeg',
            itemName: 'camping',
            location: 'Cairo',
            progressValue: 0.4),
        PopularCard(
            imageUrl: 'assets/images/car2.jpeg',
            itemName: 'Toyota',
            location: 'Quesna',
            progressValue: 0.8),
      ],
    );
  }
}
