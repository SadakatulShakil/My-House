import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_house/Screens/Administrator/administrator_home_page.dart';
import 'package:my_house/Screens/HomePage/home_page.dart';

import '../../Api/NetworkCall.dart';

class MobileVerificationScreen extends StatefulWidget {
  String role;
  String getOtp;
  String number;
  MobileVerificationScreen(this.role, this.getOtp, this.number);

  @override
  _MobileVerificationScreenState createState() =>
      _MobileVerificationScreenState();
}

class _MobileVerificationScreenState extends State<MobileVerificationScreen> {
  NetworkCall networkCall = NetworkCall();
  TextEditingController _fieldOne = TextEditingController();

  // TextEditingController _fieldTwo = TextEditingController();
  // TextEditingController _fieldThree = TextEditingController();
  // TextEditingController _fieldFour = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;

  @override
  void initState() {
    // TODO: implement initState
    _fieldOne.text = widget.getOtp.toString();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: Get.isDarkMode?Colors.white:Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode?Colors.white:Color(0x2301A9B8),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/otp.png',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Verification',
                    style: GoogleFonts.comfortaa(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter your OTP code number",
                    style: GoogleFonts.comfortaa(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Implement 4 input fields
                          Padding(
                            padding: const EdgeInsets.only(left:25, right: 25.0),
                            child: TextField(
                              maxLength: 6,
                              textAlign: TextAlign.center,
                              controller: _fieldOne,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                  labelText: 'OTP' ,labelStyle: GoogleFonts.comfortaa(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                                  hintText: 'Enter 4 digit otp',hintStyle: GoogleFonts.comfortaa(
                                fontSize: 15,
                              )
                              ),
                              autofocus: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: InkWell(
                      onTap: (){
                        print('clicked verify');
                          String gOtp = widget.getOtp.toString();
                          print('gOtp: '+gOtp.toString()+'/////'+'GetOtp: '+ _fieldOne.text.toString());
                          if( gOtp.toString() == _fieldOne.text.toString()){
                            //callOtpApi();
                            if(widget.role == 'user'){
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => HomePage('false')
                              ));
                            }else{
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => AdministratorHomePage()
                              ));
                            }

                          }
                      },
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFF01A9B8)
                          ),
                          child: Center(
                            child: Text("Verify now", style: GoogleFonts.comfortaa(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Didn't you receive any code?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Resend New Code",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF01A9B8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void callOtpApi() async{
  //   // CommonOperation.showProgressDialog(
  //   //     context, "loading", true);
  //   // final bookingHospitalData = await networkCall.postDoctorRegistration(
  //   //     name,
  //   //     mobile,
  //   //     password,
  //   // );
  //   // if (bookingHospitalData?.status == 200) {
  //   //   String message = bookingHospitalData!.message!;
  //   //   print('hospital data'+ message.toString());
  //   //   CommonOperation.hideProgressDialog(context);
  //   //   showToastMessage(message);
  //   //   setState(() {});
  //   // }else{
  //   //   CommonOperation.hideProgressDialog(context);
  //   //   setState(() {});
  //   //   showToastMessage('Something went wrong !');
  //   //   print('error '+ 'get error');
  //   // }
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDashBoard()));
  //
  // }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        //message to show toast
        toastLength: Toast.LENGTH_LONG,
        //duration for message to show
        gravity: ToastGravity.CENTER,
        //where you want to show, top, bottom
        timeInSecForIosWeb: 1,
        //for iOS only
        textColor: Colors.white,
        //message text color
        fontSize: 16.0 //message font size
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}