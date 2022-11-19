import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_house/Screens/LoginScreen/user_login.dart';
import '../../Api/NetworkCall.dart';
import 'administrator_login.dart';
import 'mobile_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  NetworkCall networkCall = NetworkCall();
  String from = 'login';
  bool _passwordVisible = false;
  String generateOtp = '1234';
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF01A9B8),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color(0x3FFFF00),
          elevation: 0,
          title: Text('',
              style: GoogleFonts.comfortaa(
                  color: const Color(0xFFFFFFFF), fontWeight: FontWeight.w900)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Image.asset(
                    "assets/images/login_image.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  transform: Matrix4.translationValues(0, 350, 1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 5.0,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Container(
                            height: 45,

                            child:  TabBar(
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.black,
                              tabs: const  [
                                Tab(text: 'User '),
                                Tab(text: 'Administrator ',)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: TabBarView(
                              children:  [
                                UserLoginPage(),
                                AdministratorLoginPage(),
                              ],
                            )
                        )
                      ],
                    ),
                  )
                  ),
            ],
          ),
        ));
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
