import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_house/Screens/RegistrationScreen/registration_page.dart';

import '../../Common/appbar.dart';
import '../SecurityPart/security_homepage.dart';
import '../web_view_page.dart';

class HomePage extends StatefulWidget {
  String isRegistered;

  HomePage(this.isRegistered);

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
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData(context);
    //SchedulerBinding.instance.addPostFrameCallback((_) => OpenDialog(context));
    print('--------------------->');
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> sliderList = carouselImageList
        .map((item) => Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Stack(
                  children: [
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
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
                        )),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text('Carousel',
                            style: GoogleFonts.comfortaa(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
    return Scaffold(
      drawer: new Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset(
                      'assets/images/my_wallet.png',
                    ),
                    radius: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Wallet amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '\$ 0.0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0),
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
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 8, top: 8.0, bottom: 8.0),
                child: Text("My Security",
                    style: GoogleFonts.nanumGothic(
                        color: Colors.black, fontSize: 20)),
              ),
            ),
            GridView.count(
              childAspectRatio: 0.95,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              primary: false,
              padding: const EdgeInsets.only(left: 15, right: 15),
              crossAxisCount: 4,
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side:
                                new BorderSide(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/pro_icon.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Profile',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewPage(
                                'Online GD', "http://gd.police.gov.bd/")));
                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side:
                                new BorderSide(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/gd_image.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Online GD',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {
                    OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side:
                                new BorderSide(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/sos_image.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'SOS Number',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewPage(
                                'Income Tax', "https://nbr.gov.bd/")));
                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side:
                                new BorderSide(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/tax_image.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Income Tax',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {
                    OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side:
                                new BorderSide(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/service.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Services',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewPage(
                                'Security Products',
                                "https://www.startech.com.bd/Security-Camera/cc-camera")));
                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side:
                                new BorderSide(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/products.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Products',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {
                    OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side:
                                new BorderSide(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/cc_image.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'CC Camera',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                // Column(
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         OpenTrueDialog(context);
                //       },
                //       child: Card(
                //         shape: new RoundedRectangleBorder(
                //             side: new BorderSide(
                //                 color: Colors.black12, width: 1),
                //             borderRadius: BorderRadius.circular(8)),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment:
                //           CrossAxisAlignment.center,
                //           children: [
                //             // const SizedBox(height: 7),
                //             Image.asset(
                //               'assets/images/complain_box.png',
                //               fit: BoxFit.fitWidth,
                //               height: 40,
                //               width: 40,
                //             ),
                //             const SizedBox(height: 10),
                //
                //           ],
                //         ),
                //       ),
                //     ),
                //     Text(
                //       'Complain box',
                //       style: const TextStyle(fontSize: 13),
                //     ),
                //   ],
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecurityHomeScreen()));
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side: new BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.red.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'More',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 1,),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 8, top: 8.0, bottom: 8.0),
                child: Text("App Features",
                    style: GoogleFonts.nanumGothic(
                        color: Colors.black, fontSize: 20)),
              ),
            ),
            GridView.count(
              childAspectRatio: 0.95,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              primary: false,
              padding: const EdgeInsets.only(left: 15, right: 15),
              crossAxisCount: 4,
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    //           widget.isRegistered=='false'?OpenDialog(context):Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityHomeScreen()));
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);

                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/management.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Management',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/maintanence.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Maintenance',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);

                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/ecommerse.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'E-commerce',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/maintanence.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Asset',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);

                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/management.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Buy & Sell',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side: new BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.red.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'More',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 1,),

            CarouselSlider(
                items: sliderList,
                options: CarouselOptions(
                    autoPlay: true, enlargeCenterPage: true, aspectRatio: 3.0)),
            SizedBox(
              height: 10,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 8, top: 8.0, bottom: 8.0),
                child: Text("Manpower Service (Expert Hire)",
                    style: GoogleFonts.nanumGothic(
                        color: Colors.black, fontSize: 20)),
              ),
            ),
            GridView.count(
              childAspectRatio: 0.95,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              primary: false,
              padding: const EdgeInsets.only(left: 15, right: 15),
              crossAxisCount: 4,
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/maintanence.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Asset',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);

                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/management.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Buy & Sell',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side: new BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.red.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'More',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 1,),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 8, top: 8.0, bottom: 8.0),
                child: Text("Service aolution",
                    style: GoogleFonts.nanumGothic(
                        color: Colors.black, fontSize: 20)),
              ),
            ),
            GridView.count(
              childAspectRatio: 0.95,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              primary: false,
              padding: const EdgeInsets.only(left: 15, right: 15),
              crossAxisCount: 4,
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/maintanence.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Asset',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);

                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/management.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Buy & Sell',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/maintanence.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Asset',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);

                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/management.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Buy & Sell',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/maintanence.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Asset',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);

                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/management.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Buy & Sell',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side: new BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.red.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'More',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 1,),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 8, top: 8.0, bottom: 8.0),
                child: Text("Shoping",
                    style: GoogleFonts.nanumGothic(
                        color: Colors.black, fontSize: 20)),
              ),
            ),
            GridView.count(
              childAspectRatio: 0.95,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              primary: false,
              padding: const EdgeInsets.only(left: 15, right: 15),
              crossAxisCount: 4,
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/maintanence.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Asset',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);

                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/management.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Buy & Sell',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);

                    //OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/management.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Buy & Sell',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //         widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Security',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      Card(
                        shape: new RoundedRectangleBorder(
                            side: new BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.red.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/security.png',
                                fit: BoxFit.fitWidth,
                                height: 35,
                                width: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'More',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 1,),

            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Offers ???",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 17, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4.5,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                "assets/images/otp.png",
                                height: 60,
                                width: MediaQuery.of(context).size.width / 4,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text('Dummy Deal'),
                            Text('Dummy Deal'),
                            Text('??? ??? ??? ??? ???'),
                          ],
                        )),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Suggestion ????",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 17, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4.5,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                "assets/images/otp.png",
                                height: 60,
                                width: MediaQuery.of(context).size.width / 4,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text('Dummy Deal'),
                            Text('Dummy Deal'),
                            Text('??? ??? ??? ??? ???'),
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

  void OpenDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding:
                const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text('Welcome',
                        style: GoogleFonts.comfortaa(fontSize: 18)),
                  )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context, false);
                          },
                          child: Icon(Icons.cancel_outlined))),
                ]),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/splash.png',
                        width: 60,
                        height: 60,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Thank you for connecting with us',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.comfortaa(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 12)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Please register first to get all the access of our services !',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w900, fontSize: 15)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context, false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                  // setState(() {
                  //
                  // });
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF01A9B8),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Register now',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                          color: const Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              )
            ],
          );
        });
  }

  void OpenTrueDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding:
                const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text('Welcome',
                        style: GoogleFonts.comfortaa(fontSize: 18)),
                  )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context, false);
                          },
                          child: Icon(Icons.cancel_outlined))),
                ]),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/splash.png',
                        width: 60,
                        height: 60,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Thank you for connecting with us',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.comfortaa(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 12)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Please wait! we are developing our services !',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w900, fontSize: 15)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context, false);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                  // setState(() {
                  //
                  // });
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF01A9B8),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('OK',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                          color: const Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              )
            ],
          );
        });
  }

  void getUserData(BuildContext context) {
    if (widget.isRegistered == 'false') {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => OpenDialog(context));
    }
    setState(() {});
  }
}
