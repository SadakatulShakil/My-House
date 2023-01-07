import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_house/Screens/RegistrationScreen/registration_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Common/appbar.dart';

class AdministratorHomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<AdministratorHomePage> {
  List<String> carouselImageList = [
    'assets/images/b1.jpg',
    'assets/images/b2.png',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg'
  ];
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('Jun', 60),
    _SalesData('Jul', 25),
    _SalesData('Aug', 35),
    _SalesData('Sep', 42),
    _SalesData('Oct', 50),
    _SalesData('Nov', 30),
    _SalesData('Dec', 48),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getUserData(context);
    //SchedulerBinding.instance.addPostFrameCallback((_) => OpenDialog(context));
    print('--------------------->');
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Image.asset(
                      'assets/images/my_wallet.png',
                    ),
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
              leading: Icon(Icons.open_with_rounded),
              title: Text('House Owner information', style: TextStyle(fontSize: 15)),
              onTap: () {
                // Here you can give your route to navigate

              },
            ),
            ListTile(
              leading: Icon(Icons.open_with_rounded),
              title: Text('Renter information', style: TextStyle(fontSize: 15)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.open_with_rounded),
              title: Text('House-keeper information', style: TextStyle(fontSize: 15)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.open_with_rounded),
              title: Text('Care-taker information', style: TextStyle(fontSize: 15)),
              onTap: () {
                // Here you can give your route to navigate

              },
            ),
            ListTile(
              leading: Icon(Icons.open_with_rounded),
              title: Text('Driver information', style: TextStyle(fontSize: 15)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.open_with_rounded),
              title: Text('Home tutor information', style: TextStyle(fontSize: 15)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out', style: TextStyle(fontSize: 15)),
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
              childAspectRatio: 1.4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                  onTap: (){
                      //widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 7),
                        const SizedBox(height: 10),
                        Text(
                          'Total',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '1200',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    //widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 7),
                        const SizedBox(height: 10),
                        Text(
                          'Land lord',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '300',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    //widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 7),

                        const SizedBox(height: 10),
                        Text(
                          'Family',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '400',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    //widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 7),
                        const SizedBox(height: 10),
                        Text(
                          'Sublet',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '300',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    //widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 7),
                        const SizedBox(height: 10),
                        Text(
                          'Mess',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '200',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    //widget.isRegistered=='false'?OpenDialog(context):OpenTrueDialog(context);
                  },
                  child: Card(
                    shape: new RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    color: Colors.red.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 7),
                        Image.asset(
                          'assets/images/security.png',
                          fit: BoxFit.fitWidth,
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'More',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Yearly User analysis'),
                // Enable legend
                legend: Legend(isVisible: true, position: LegendPosition.top),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'User',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
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
            insetPadding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Align(
                    alignment: Alignment.center,
                    child: Text('Welcome',style: GoogleFonts.comfortaa(
                        fontSize: 18
                    )),
                  )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context, false);
                          },
                          child: Icon(Icons.cancel_outlined))),
                ]),

            content: Container(
              height: MediaQuery.of(context).size.height/6,
              width: MediaQuery.of(context).size.width/6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/splash.png', width: 60,height: 60,),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Thank you for connecting with us',textAlign: TextAlign.center,
                                  style: GoogleFonts.comfortaa(
                                      fontWeight: FontWeight.w900, fontSize: 12)),
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
                    child: Text('Please register first to get all the access of our services !',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w900, fontSize: 15)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.pop(context, false);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                  // setState(() {
                  //
                  // });
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0,),
                  padding: EdgeInsets.only(left: 8.0,  top: 8.0, bottom: 8.0),
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
                  child:  Align(
                    alignment: Alignment.center,
                    child: Text('Register now', textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,) ),
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
            insetPadding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Align(
                    alignment: Alignment.center,
                    child: Text('Welcome',style: GoogleFonts.comfortaa(
                        fontSize: 18
                    )),
                  )),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context, false);
                          },
                          child: Icon(Icons.cancel_outlined))),
                ]),

            content: Container(
              height: MediaQuery.of(context).size.height/6,
              width: MediaQuery.of(context).size.width/6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/splash.png', width: 60,height: 60,),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Thank you for connecting with us',textAlign: TextAlign.center,
                                  style: GoogleFonts.comfortaa(
                                      fontWeight: FontWeight.w900, fontSize: 12)),
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
                onTap: (){
                  Navigator.pop(context, false);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                  // setState(() {
                  //
                  // });
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0,),
                  padding: EdgeInsets.only(left: 8.0,  top: 8.0, bottom: 8.0),
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
                  child:  Align(
                    alignment: Alignment.center,
                    child: Text('OK', textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,) ),
                  ),
                ),
              )
            ],
          );
        });
  }

  // void getUserData(BuildContext context){
  //   if(widget.isRegistered == 'false'){
  //     SchedulerBinding.instance.addPostFrameCallback((_) => OpenDialog(context));
  //   }
  //   setState(() {
  //
  //   });
  // }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
