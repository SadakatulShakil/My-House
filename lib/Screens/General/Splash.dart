import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_house/Screens/HomePage/home_page.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../LoginScreen/login_page.dart';


class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InitState();

}

class InitState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    print("running splash");
    startTimer();
    super.initState();
  }

  startTimer() async{
    var duration = Duration(seconds: 5);
    return new Timer(duration, homePageRoute);
  }

  homePageRoute(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => LoginScreen()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              margin:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height/5),
              child: Image.asset("assets/images/splash.png", width: 200, height: 200),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: JumpingDotsProgressIndicator(
                    fontSize: 50.0,
                    numberOfDots: 5,
                    color: new Color(0xFF00A6FF),
                    milliseconds: 120,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


}
