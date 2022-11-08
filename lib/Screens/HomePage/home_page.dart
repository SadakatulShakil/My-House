import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Common/appbar.dart';
import '../../language/Languages.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'
  ];

  @override
  Widget build(BuildContext contetx) {
    final List<Widget> sliderList =
    carouselImageList.map((item) =>
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Stack(
              children: [
                Image.asset(item, fit: BoxFit.cover, width: 1000,),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Carousel',
                        style: GoogleFonts.comfortaa(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        )).toList();
    return Scaffold(
      drawer: new Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.black26
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://icons.iconarchive.com/icons/flat-icons.com/flat/512/Wallet-icon.png'),
                    radius: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Wallet amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text('\$ 0.0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Here you place your menu items
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate

              },
            ),
            Divider(height: 3.0),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate

              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Close Drawer', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      appBar: commonAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),
            CarouselSlider(items: sliderList, options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 3.0
            )),
            SizedBox(height: 10,),
            GridView.count(
              childAspectRatio: 1.1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisCount: 3,
              shrinkWrap: true,
              children: <Widget>[
                dashBoardCard(
                  text: "Security",
                  imagePath: "assets/images/security.png",
                ),
                dashBoardCard(
                  text: "Management",
                  imagePath: "assets/images/management.png",
                ),
                dashBoardCard(
                  text: "Maintenance",
                  imagePath: "assets/images/maintanence.png",
                ),
                dashBoardCard(
                  text: "E-commerce",
                  imagePath: "assets/images/ecommerse.png",
                ),
                dashBoardCard(
                  text: "Asset",
                  imagePath: "assets/images/maintanence.png"
                ),
                dashBoardCard(
                  text: "Buy & Sell",
                  imagePath: "assets/images/management.png",
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Deals ⚡", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Text("View all", style: TextStyle(fontSize: 18, color: Colors.blueAccent),),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height/4.5,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width/3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset("assets/images/otp.png", height: 60, width: MediaQuery.of(context).size.width/4, fit: BoxFit.fill,),
                            ),
                            SizedBox(height: 8,),
                            Text('Dummy Deal'),
                            Text('Dummy Deal'),
                            Text('⭐ ⭐ ⭐ ⭐ ⭐'),
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget dashBoardCard({required String text, required String imagePath}) {
  return Container(
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(height: 7),
          Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
            height: 40,
            width: 40,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    ),
  );
}
