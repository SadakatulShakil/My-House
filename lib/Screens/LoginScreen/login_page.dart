import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Api/NetworkCall.dart';
import 'mobile_verification_screen.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();

}
class _LoginScreenState extends State<LoginScreen>{
  NetworkCall networkCall = NetworkCall();
  String from  = 'login';
  String generateOtp  = '1234';
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar:  AppBar(
          backgroundColor: const Color(0x3FFFF00),
          elevation: 0,
          title: Text('',
              style: GoogleFonts.comfortaa(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w900)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15,),
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/login_image.png',),
                          fit: BoxFit.fill
                      )
                  )
                ),
                SizedBox(height: 10,),
                Text("Please Login", style: GoogleFonts.comfortaa(fontSize: 20, fontWeight: FontWeight.w900),),
                SizedBox(height: 10,),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.black54,
                        elevation: 8,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: TextField(
                                  controller: mobileController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Your mobile no',labelStyle: GoogleFonts.comfortaa(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                      hintText: 'Enter your mobile no',hintStyle: GoogleFonts.comfortaa(
                                    fontSize: 15,
                                  )
                                  ),
                                  autofocus: false,
                                ),
                              ),
                              SizedBox(height: 12.0,),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',labelStyle: GoogleFonts.comfortaa(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                      hintText: 'Enter a password',hintStyle: GoogleFonts.comfortaa(
                                    fontSize: 15,
                                  )
                                  ),
                                  autofocus: false,
                                ),
                              )
                              // Row(
                              //   children: [
                              //     Flexible(
                              //       flex: 1,
                              //       child:
                              //       CountryCodePicker(
                              //         initialSelection: 'BD',
                              //         showCountryOnly: false,
                              //         showOnlyCountryWhenClosed: false,
                              //         favorite: ['+88','BD'],
                              //         enabled: true,
                              //         hideMainText: false,
                              //         showFlagMain: true,
                              //         showFlag: true,
                              //         hideSearch: false,
                              //         searchDecoration: InputDecoration(
                              //           hintText: 'search by country code',
                              //         ),
                              //         showFlagDialog: true,
                              //       ),
                              //     ),
                              //     Flexible(
                              //       flex: 2,
                              //       child: Padding(
                              //         padding: const EdgeInsets.only(right: 5.0),
                              //         child: TextField(
                              //           keyboardType: TextInputType.number,
                              //           decoration: InputDecoration(
                              //               isDense: true,
                              //               border: OutlineInputBorder(),
                              //               labelText: 'Your mobile no',labelStyle: GoogleFonts.comfortaa(
                              //             fontSize: 15,
                              //             fontWeight: FontWeight.w700,
                              //           ),
                              //               hintText: 'Enter your mobile no',hintStyle: GoogleFonts.comfortaa(
                              //             fontSize: 15,
                              //           )
                              //           ),
                              //           autofocus: false,
                              //         ),
                              //       ),)
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: InkWell(
                        onTap: (){
                          //callDoctorLoginApi(mobileController.text, passwordController.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MobileVerificationScreen(generateOtp, mobileController.text.toString())));
                        },
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFF01A9B8)
                            ),
                            child: Center(
                              child: Text("Login", style: GoogleFonts.comfortaa(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorRegistrationScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Text("Do not register yet? Register", style:
                            GoogleFonts.comfortaa(color: const Color(0xFF01A9B8),
                                fontWeight: FontWeight.w900),),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  // void callDoctorLoginApi(String mobile, String password) async{
  //   CommonOperation.showProgressDialog(
  //       context, "loading", true);
  //   final bookingHospitalData = await networkCall.postDoctorLogin(
  //       mobile,
  //       password,
  //   );
  //   if (bookingHospitalData?.status == 200) {
  //     String message = bookingHospitalData!.message!;
  //     print('hospital data'+ message.toString());
  //     CommonOperation.hideProgressDialog(context);
  //     showToastMessage(message);
  //     setState(() {
  //       Navigator.pushReplacement(context, MaterialPageRoute(
  //           builder: (context) => DoctorDashBoard()
  //       ));
  //     });
  //   }else{
  //     CommonOperation.hideProgressDialog(context);
  //     setState(() {});
  //     showToastMessage('Something went wrong !');
  //     print('error '+ 'get error');
  //   }
  //   // Navigator.pushReplacement(context, MaterialPageRoute(
  //   //     builder: (context) => DoctorDashBoard()
  //   // ));
  // }
  //
  // void showToastMessage(String message) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       //message to show toast
  //       toastLength: Toast.LENGTH_LONG,
  //       //duration for message to show
  //       gravity: ToastGravity.CENTER,
  //       //where you want to show, top, bottom
  //       timeInSecForIosWeb: 1,
  //       //for iOS only
  //       textColor: Colors.white,
  //       //message text color
  //       fontSize: 16.0 //message font size
  //   );
  // }

}