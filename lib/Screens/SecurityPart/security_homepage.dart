import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_house/Screens/web_view_page.dart';

class SecurityHomeScreen extends StatefulWidget {
  @override
  State<SecurityHomeScreen> createState() => _SecurityHomeScreenState();
}

class _SecurityHomeScreenState extends State<SecurityHomeScreen> {
  bool _passwordVisible = false;
  bool agree = false;
  int error = 0;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  String val = 'false',
      name = '',
      userId = '',
      imageUrl = '',
      _getUserName = "",
      _getPassword = "",
      userName = '',
      password = '';

  @override
  void initState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xFF01A9B8),
        body: SafeArea(
          child: SingleChildScrollView(
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(microseconds: 2000),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Image.asset(
                        "assets/images/bannersecurity.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      transform: Matrix4.translationValues(0, 160, 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: Text("Security",
                                style: GoogleFonts.nanumGothic(
                                    color: Colors.lightBlue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900)),
                          ),
                          GridView.count(
                            childAspectRatio: 1.1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            primary: false,
                            padding: const EdgeInsets.all(16),
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  OpenTrueDialog(context);
                                },
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // const SizedBox(height: 7),
                                      Image.asset(
                                        'assets/images/pro_icon.png',
                                        fit: BoxFit.fitWidth,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Profile',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebViewPage(
                                              'Online GD',
                                              "http://gd.police.gov.bd/")));
                                  //OpenTrueDialog(context);
                                },
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // const SizedBox(height: 7),
                                      Image.asset(
                                        'assets/images/gd_image.png',
                                        fit: BoxFit.fitWidth,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Online GD',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  OpenTrueDialog(context);
                                },
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // const SizedBox(height: 7),
                                      Image.asset(
                                        'assets/images/sos_image.png',
                                        fit: BoxFit.fitWidth,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'SOS Number',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebViewPage(
                                              'Income Tax',
                                              "https://nbr.gov.bd/")));
                                  //OpenTrueDialog(context);
                                },
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // const SizedBox(height: 7),
                                      Image.asset(
                                        'assets/images/tax_image.png',
                                        fit: BoxFit.fitWidth,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Income Tax',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  OpenTrueDialog(context);
                                },
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // const SizedBox(height: 7),
                                      Image.asset(
                                        'assets/images/service.png',
                                        fit: BoxFit.fitWidth,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Services',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
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
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // const SizedBox(height: 7),
                                      Image.asset(
                                        'assets/images/products.png',
                                        fit: BoxFit.fitWidth,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Products',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  OpenTrueDialog(context);
                                },
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // const SizedBox(height: 7),
                                      Image.asset(
                                        'assets/images/cc_image.png',
                                        fit: BoxFit.fitWidth,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'CC Camera',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  OpenTrueDialog(context);
                                },
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // const SizedBox(height: 7),
                                      Image.asset(
                                        'assets/images/complain_box.png',
                                        fit: BoxFit.fitWidth,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Complain box',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  OpenTrueDialog(context);
                                },
                                child: Card(
                                  shape: new RoundedRectangleBorder(
                                      side: new BorderSide(
                                          color: Colors.red, width: 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  color: Colors.red.shade100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
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
}
