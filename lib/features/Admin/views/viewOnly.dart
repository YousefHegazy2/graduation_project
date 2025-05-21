import 'package:flutter/material.dart';
import 'package:local_hero_transform/local_hero_transform.dart';
import 'package:rentora_app/features/dashboard/views/Dashboard.dart';


class ViewOnly extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ValueNotifier<FavoriteShape> _switchNotifier;

  @override
  void initState() {
    super.initState();
    _switchNotifier = ValueNotifier(FavoriteShape.gird);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _switchNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 32, 47, 1) ,
      appBar: AppBar(
        backgroundColor: darkBlue,
        surfaceTintColor: darkBlue,
        centerTitle: true,
        title: Text('RENTORA' , style: TextStyle(color: Colors.white , fontFamily: "Nunito", fontSize: 20),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildSwitchGridAndListButton(),
          )
        ],
        leading: IconButton(icon : Icon(Icons.arrow_back, size:20,color: Colors.white,), onPressed: (){
           Navigator.pop(context); // اغلق الـ Drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainHomeScreen(),
              ),
            );
        },),
      ),
      body: LocalHero(
        controller: _tabController,
        pages: [ListViewContent(), GridViewContent()],
      ),
    );
  }

  Widget _buildSwitchGridAndListButton() {
    return ValueListenableBuilder(
      valueListenable: _switchNotifier,
      builder: (context, value, child) {
        return ConstrainedBox(
          constraints: BoxConstraints.tight(Size(35, 35)),
          child: AspectRatio(
            aspectRatio: 1.9 / 2,
            child: RawMaterialButton(
              onPressed: () => _switchBetweenGridAndList(),
              elevation: 0,
              visualDensity: const VisualDensity(
                vertical: -4,
                horizontal: -4,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: Colors.blue,
              child: Icon(
                _tabController.index == 0
                    ? Icons.grid_view_rounded
                    : Icons.view_agenda_outlined,
                size: 20 - 4,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  void _switchBetweenGridAndList() {
    if (_switchNotifier.value == FavoriteShape.gird) {
      _tabController.animateTo(1);
      _switchNotifier.value = FavoriteShape.list;
    } else {
      _tabController.animateTo(0);
      _switchNotifier.value = FavoriteShape.gird;
    }
  }
}

class GridViewContent extends StatelessWidget {
  const GridViewContent({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 16 / 21.5,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      padding: const EdgeInsets.all(20.0),
      children: List.generate(
        locations.length,
        (index) => BaseCard(index: index),
      ),
    );
  }
}

class ListViewContent extends StatelessWidget {
  const ListViewContent({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BaseCard(index: index),
          ),
        );
      },
    );
  }
}

class BaseCard extends StatelessWidget {
  const BaseCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: index,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                locations[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildGradient(),
            _buildTitleAndSubtitle(
              locations[index].name,
              locations[index].place,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle(String name, country) {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class Location {
  const Location(
      {required this.name, required this.place, required this.imageUrl});
  final String name;
  final String place;
  final String imageUrl;
}

const locations = [
  
  Location(
      name: 'Camping Tent',
      place: 'Siwa Oasis',
     imageUrl: "assets/images/tent.jpeg"),
  Location(
      name: 'Kayak Rental',
      place: 'Dahab',
    imageUrl: "assets/images/kayak.jpg"),
  Location(
      name: 'Golf',
      place: '6 october ',
      imageUrl: "assets/images/golf.jpeg"),
  Location(
      name: 'Snorkling',
      place: 'Sharm El Sheikh',
      imageUrl: "assets/images/snorkling.jpg"),
  Location(
      name: 'Sports Cars',
      place: 'cairo',
      imageUrl: "assets/images/cars.jpg"),
  Location(
      name: 'Helmets',
      place: 'Shebin-Elkom',
     imageUrl: "assets/images/helmet.jpg"),
  Location(
      name: 'cars',
      place: 'Luxor',
      imageUrl: "assets/images/car2.jpeg"),
      Location(
      name: 'Motorcycle', place: 'Cairo', imageUrl: "assets/images/motor.jpg"),
      Location(
      name: 'sports tools',
      place: 'Luxor',
      imageUrl: "assets/images/tools.jpeg"),
      Location(
      name: 'Skiing Equipments',
      place: 'Ice Center',
      imageUrl: "assets/images/box.jpeg"),

];
  // Location(name: 'Yemen', place: "Sana'a", imageUrl: "assets/images/tools.jpeg"),
const darkBlue = Color.fromARGB(255, 18, 32, 47);

enum FavoriteShape { gird, list }
