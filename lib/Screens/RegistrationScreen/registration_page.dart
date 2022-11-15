import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_house/Common/care_taker.dart';
import 'package:my_house/Common/family_member.dart';
import 'package:my_house/Common/house_keeper.dart';
import 'package:provider/provider.dart';

import '../../language/Languages.dart';
import '../HomePage/home_page.dart';
// import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstFormKey = GlobalKey<FormState>();
  final _secondFormKey = GlobalKey<FormState>();
  final _thirdFormKey = GlobalKey<FormState>();
  final _forthFormKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController(text: '');
  var lastNameController = TextEditingController(text: '');
  // var designationController = TextEditingController(text: '');
  // var departmentController = TextEditingController(text: '');
  // var salaryController = TextEditingController(text: '');
  var emailController = TextEditingController(text: '');
  var phoneController = TextEditingController(text: '');
  var passwordController = TextEditingController(text: '');
  var confirmPasswordController = TextEditingController(text: '');
  var accountTypeController = TextEditingController(text: "Free");
  var shopNameController = TextEditingController(text: "");
  var shopUserNameController = TextEditingController(text: "");
  var addressController = TextEditingController(text: "");

  var shopTypeController = TextEditingController(text: "");
  var stateController = TextEditingController(text: "");
  var cityController = TextEditingController(text: "");
  var townController = TextEditingController(text: "");

  bool termsAndConditions = false;

  List<String> accountType = [
    'Free',
    'Paid',
  ];
  List<String> divisionList = [
    'Dhaka',
    'Rangpur',
  ];
  List<String> districtList = [
    'Dhaka',
    'Madaripur',
    'Rangpur',
    'Dinajpur',
  ];
  List<String> thanaList = [
    'Pirgachha',
    'Badarganj',
    'Mithapukur',
  ];List<String> wordList = [
    '12',
    '33',
    '42',
    '39',
  ];
  List<FamilyMember> familyMemberList = [];
  FamilyMember user = new FamilyMember();
  List<HouseKeeper> houseKeeperList = [];
  HouseKeeper houseKeeper = new HouseKeeper();
  List<CareTaker> careTakerList = [];
  CareTaker careTaker = new CareTaker();

  // List<ShopTypeModel> shopTypeList = [];
  // List<StateModel> stateList = [];
  // List<CityModel> cityList = [];
  // List<TownModel> townList = [];

  File? shopLogoImage;
  File? shopBannerImage;

  bool isFormSubmitting = false;

  void userForm() async {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => isFormSubmitting = true);
    // setState(() => _currentIndex = 1);

    if (!_firstFormKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: 'Please provide all information.');
    } else {
      // await initializing();
      setState(() => currentStep = 1);
    }

    setState(() => isFormSubmitting = false);
  }

  void familyMemberForm() async {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => isFormSubmitting = true);

    if (!_secondFormKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: 'Please provide all information.');
      setState(() => isFormSubmitting = false);
      return;
    }

    // if (stateController.text == '') {
    //   Fluttertoast.showToast(msg: 'State is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }

    // if (cityController.text == '') {
    //   Fluttertoast.showToast(msg: 'City is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }
    //
    // if (townController.text == '') {
    //   Fluttertoast.showToast(msg: 'Town is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }
    //
    // if (shopLogoImage == null) {
    //   Fluttertoast.showToast(msg: 'Shop logo is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }
    //
    // if (shopBannerImage == null) {
    //   Fluttertoast.showToast(msg: 'Shop banner is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }

    setState(() => currentStep = 2);

    setState(() => isFormSubmitting = false);
  }

  void HouseKeeperForm() async {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => isFormSubmitting = true);

    if (!_thirdFormKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: 'Please provide all information.');
      setState(() => isFormSubmitting = false);
      return;
    }

    // if (stateController.text == '') {
    //   Fluttertoast.showToast(msg: 'State is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }

    // if (cityController.text == '') {
    //   Fluttertoast.showToast(msg: 'City is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }
    //
    // if (townController.text == '') {
    //   Fluttertoast.showToast(msg: 'Town is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }
    //
    // if (shopLogoImage == null) {
    //   Fluttertoast.showToast(msg: 'Shop logo is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }
    //
    // if (shopBannerImage == null) {
    //   Fluttertoast.showToast(msg: 'Shop banner is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }

    setState(() => currentStep = 3);

    setState(() => isFormSubmitting = false);
  }
  void CareTakerForm() async {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => isFormSubmitting = true);

    if (!_forthFormKey.currentState!.validate()) {
      Fluttertoast.showToast(msg: 'Please provide all information.');
      setState(() => isFormSubmitting = false);
      return;
    }

    // if (stateController.text == '') {
    //   Fluttertoast.showToast(msg: 'State is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }

    // if (cityController.text == '') {
    //   Fluttertoast.showToast(msg: 'City is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }
    //
    // if (townController.text == '') {
    //   Fluttertoast.showToast(msg: 'Town is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }
    //
    // if (shopLogoImage == null) {
    //   Fluttertoast.showToast(msg: 'Shop logo is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }
    //
    // if (shopBannerImage == null) {
    //   Fluttertoast.showToast(msg: 'Shop banner is required!');
    //   setState(() => isFormSubmitting = false);
    //   return;
    // }

    setState(() => currentStep = 4);

    setState(() => isFormSubmitting = false);
  }

  void submitForm() async {
    setState(() => isFormSubmitting = true);
    if (termsAndConditions == false) {
      Fluttertoast.showToast(msg: "Accept terms and conditions!");
      setState(() => isFormSubmitting = false);
      return;
    }
    // Map<String, dynamic> location = await Helper.location();
    // FormData formData = FormData.fromMap({
    //   "first_name": firstNameController.text,
    //   "last_name": lastNameController.text,
    //   "email": emailController.text,
    //   "phone": phoneController.text,
    //   "password": passwordController.text,
    //   // "password_confirmation": confirmPasswordController.text,
    //   "account_type": accountTypeController.text,
    //   "shop_name": shopNameController.text,
    //   "slug": shopUserNameController.text,
    //   "address": addressController.text,
    //   // "shop_type_id": shopTypeController.text,
    //   "shop_type_id": shopTypeModel?.id,
    //   "state_id": stateModel?.id,
    //   "city_id": cityModel?.id,
    //   "town_id": townModel?.id,
    //   "latitude": "",
    //   "longitude": "",
    //   // "join_date": joinDate.toString(),
    //   // "dob": birthDate.toString(),
    //   "logo": shopLogoImage == null
    //       ? null
    //       : await MultipartFile.fromFile(shopLogoImage!.path,
    //       filename: shopLogoImage!.path.split('/').last),
    //   "banner": shopBannerImage == null
    //       ? null
    //       : await MultipartFile.fromFile(shopBannerImage!.path,
    //       filename: shopBannerImage!.path.split('/').last),
    // });
    //
    // Response response = await ApiHelper.post(url: API_REGISTER, body: formData);
    //
    // if (response.data != null && response.statusCode == 200) {
    //   // ignore: use_build_context_synchronously
    //   await Provider.of<AuthProvider>(context, listen: false)
    //       .register(response);
    //   Fluttertoast.showToast(msg: response.data['message']);
    //   // ignore: use_build_context_synchronously
    //   Navigator.of(context).pop();
    // } else if (response.statusCode == 422) {
    //   Map<String, dynamic> output = response.data;
    //   Map<String, dynamic> result = output['data'];
    //   // print(result.entries);
    //   String keys = result.keys.toString();
    //   // SnackBarError(context: context, msg: "$keys is required!");
    //
    //   result.values.forEach(
    //           (item) => SnackBarError(context: context, msg: "${item[0]}"));
    // } else {
    //   Fluttertoast.showToast(msg: response.data['message']);
    // }
    // setState(() => isFormSubmitting = false);
  }

  bool isInitializing = false;
  bool hideShowPassword = true;
  bool hideShowPassword2 = true;
  int currentStep = 0;
  String roleValue ='', subRoleValue='', maritalValue ='';
  String? _selectedDivision, _selectedDistrict, _selectedThana, _selectedWord;
  int? role_val, subRole_val, marital_val;
  int numberOfFamily = 1, numberOfHouseKeeper = 1, numberOfCareTaker = 1;
  DateTime? startdate;
  String initialDateText = 'Select birth date';
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    setState(() {
      // patient_val = 0;
      // sex_val = -1;
      // incentive_val = -1;
    });
    super.initState();
    startdate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/images/splash.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Stepper(
                    elevation: 0,
                    type: StepperType.horizontal,
                    currentStep: currentStep,
                    onStepContinue: () =>
                        setState(() => currentStep = currentStep + 1),
                    onStepCancel: () =>
                        setState(() => currentStep = currentStep - 1),
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      // return null;
                      if (currentStep == 1) {
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MaterialButton(
                                      elevation: 0,
                                      height: 50.0,
                                      minWidth: double.infinity,
                                      color: Theme.of(context).primaryColor,
                                      textColor:
                                      Theme.of(context).backgroundColor,
                                      child: const Text("BACK"),
                                      splashColor: Colors.greenAccent,
                                      onPressed: details.onStepCancel,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: (isFormSubmitting
                                      ? const Center(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.red)))
                                      : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MaterialButton(
                                      elevation: 0,
                                      height: 50.0,
                                      minWidth: double.infinity,
                                      color: Colors.green,
                                      textColor: Theme.of(context)
                                          .backgroundColor,
                                      child: const Text("NEXT"),
                                      onPressed: (){
                                        familyMemberForm();
                                        _addcollections(user);
                                        },
                                      splashColor: Colors.greenAccent,
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ],
                        );
                      }
                      else if (currentStep == 2) {
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MaterialButton(
                                      elevation: 0,
                                      height: 50.0,
                                      minWidth: double.infinity,
                                      color: Theme.of(context).primaryColor,
                                      textColor:
                                      Theme.of(context).backgroundColor,
                                      child: const Text("BACK"),
                                      splashColor: Colors.greenAccent,
                                      onPressed: details.onStepCancel,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: (isFormSubmitting
                                      ? const Center(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.red)))
                                      : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MaterialButton(
                                      elevation: 0,
                                      height: 50.0,
                                      minWidth: double.infinity,
                                      color: Colors.green,
                                      textColor: Theme.of(context)
                                          .backgroundColor,
                                      child: const Text("NEXT"),
                                      onPressed: (){
                                        HouseKeeperForm();
                                        _addcollections2(houseKeeper);
                                      },
                                      splashColor: Colors.greenAccent,
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ],
                        );
                      }
                      else if (currentStep == 3){
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MaterialButton(
                                      elevation: 0,
                                      height: 50.0,
                                      minWidth: double.infinity,
                                      color: Theme.of(context).primaryColor,
                                      textColor:
                                      Theme.of(context).backgroundColor,
                                      child: const Text("BACK"),
                                      splashColor: Colors.greenAccent,
                                      onPressed: details.onStepCancel,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: (isFormSubmitting
                                      ? const Center(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.red)))
                                      : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MaterialButton(
                                      elevation: 0,
                                      height: 50.0,
                                      minWidth: double.infinity,
                                      color: Colors.green,
                                      textColor: Theme.of(context)
                                          .backgroundColor,
                                      child: const Text("NEXT"),
                                      onPressed: () {
                                        CareTakerForm();
                                        _addcollections3(careTaker);
                                        },
                                      splashColor: Colors.greenAccent,
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ],
                        );
                      }
                      else if (currentStep == 4){
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MaterialButton(
                                      elevation: 0,
                                      height: 50.0,
                                      minWidth: double.infinity,
                                      color: Theme.of(context).primaryColor,
                                      textColor:
                                      Theme.of(context).backgroundColor,
                                      child: const Text("BACK"),
                                      splashColor: Colors.greenAccent,
                                      onPressed: details.onStepCancel,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: (isFormSubmitting
                                      ? const Center(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.red)))
                                      : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MaterialButton(
                                      elevation: 0,
                                      height: 50.0,
                                      minWidth: double.infinity,
                                      color: Colors.green,
                                      textColor: Theme.of(context)
                                          .backgroundColor,
                                      child: const Text("Submit"),
                                      onPressed: () => OpenDialog(context),
                                      splashColor: Colors.greenAccent,
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ],
                        );

                      }
                      else{
                        return Column(
                          children: <Widget>[
                            MaterialButton(
                              elevation: 0,
                              height: 50.0,
                              minWidth: double.infinity,
                              color: Theme.of(context).primaryColor,
                              textColor: Theme.of(context).backgroundColor,
                              child: const Text("NEXT"),
                              splashColor: Colors.greenAccent,
                              onPressed: () => userForm(),
                            ),
                          ],
                        );
                      }
                    },
                    steps: [
                      Step(
                        state: currentStep > 0
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep == 0 ? true : false,
                        title: const Text(""),
                        content: SingleChildScrollView(
                          child: Form(
                            key: _firstFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "User Information",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  child: Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 31.0,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              child: InkWell(
                                                onTap: (){
                                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileUpdatePage()));
                                                },
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: CircleAvatar(
                                                    radius: 10.0,
                                                    child: Icon(Icons.add_a_photo, size: 12,),
                                                  ),
                                                ),
                                              ),
                                              radius: 30.0,
                                              backgroundImage: AssetImage("assets/images/profile.jpg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                                        child: InkWell(
                                          onTap: (){
                                            //callDoctorLoginApi(mobileController.text, passwordController.text);
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => MobileVerificationScreen(generateOtp, mobileController.text.toString())));
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: const Color(0xFF01A9B8)
                                              ),
                                              child: Center(
                                                child: Text("Add an image", style: GoogleFonts.comfortaa(color: Colors.white,fontSize: 10),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                    child: Text("Who you are ?", style: GoogleFonts.comfortaa(fontSize: 15),)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Radio(
                                          value: 0,
                                          groupValue: role_val,
                                          onChanged: _handleRoleValueChange,
                                          activeColor: new Color(0xFF29A74A),
                                        ),
                                        Text('Owner',
                                            style: GoogleFonts.comfortaa(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        Radio(
                                          value: 1,
                                          groupValue: role_val,
                                          onChanged: _handleRoleValueChange,
                                          activeColor: new Color(0xFF29A74A),
                                        ),
                                        Text('Renter',
                                            style: GoogleFonts.comfortaa(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: role_val == 1?true:false,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Select your role ?", style: GoogleFonts.comfortaa(fontSize: 15),)),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Radio(
                                                  value: 0,
                                                  groupValue: subRole_val,
                                                  onChanged: _handleSubRoleValueChange,
                                                  activeColor: new Color(0xFF29A74A),
                                                ),
                                                Text('Family',
                                                    style: GoogleFonts.comfortaa(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                                Radio(
                                                  value: 1,
                                                  groupValue: subRole_val,
                                                  onChanged: _handleSubRoleValueChange,
                                                  activeColor: new Color(0xFF29A74A),
                                                ),
                                                Text('Sublet',
                                                    style: GoogleFonts.comfortaa(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700,
                                                    )),

                                                Radio(
                                                  value: 2,
                                                  groupValue: subRole_val,
                                                  onChanged: _handleSubRoleValueChange,
                                                  activeColor: new Color(0xFF29A74A),
                                                ),
                                                Text('Mess',
                                                    style: GoogleFonts.comfortaa(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Name",
                                    hintText: 'your Name',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Father Name",
                                    hintText: 'your father name',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Mother Name",
                                    hintText: 'Your mother name',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                SizedBox(height: 10),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("your present address ?", style: GoogleFonts.comfortaa(fontSize: 15),)),
                                Divider(),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 5.0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(left: 10.0),
                                          decoration: BoxDecoration(
                                            // //color: Colors.white,
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //       //color: Colors.black,
                                            //   )
                                            // ],
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1),
                                          ),
                                          child: DropdownButton<String>(
                                            // Not necessary for Option 1
                                            underline: SizedBox(),
                                            hint: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text(
                                                'Select division',
                                                style: GoogleFonts.comfortaa(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            value: _selectedDivision,
                                            isExpanded: true,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                //hint = '';
                                                _selectedDivision = newValue;
                                                print(
                                                    "Accoutn no: " + _selectedDivision.toString());
                                              });
                                            },
                                            items: divisionList
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: GoogleFonts.comfortaa(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(left: 10.0),
                                          decoration: BoxDecoration(
                                            // //color: Colors.white,
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //       //color: Colors.black,
                                            //   )
                                            // ],
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1),
                                          ),
                                          child: DropdownButton<String>(
                                            // Not necessary for Option 1
                                            underline: SizedBox(),
                                            hint: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text(
                                                'Select district',
                                                style: GoogleFonts.comfortaa(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            value: _selectedDistrict,
                                            isExpanded: true,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                //hint = '';
                                                _selectedDistrict = newValue;
                                                print(
                                                    "Accoutn no: " + _selectedDistrict.toString());
                                              });
                                            },
                                            items: districtList
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: GoogleFonts.comfortaa(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 5.0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(left: 10.0),
                                          decoration: BoxDecoration(
                                            // //color: Colors.white,
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //       //color: Colors.black,
                                            //   )
                                            // ],
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1),
                                          ),
                                          child: DropdownButton<String>(
                                            // Not necessary for Option 1
                                            underline: SizedBox(),
                                            hint: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text(
                                                'Select Thana',
                                                style: GoogleFonts.comfortaa(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            value: _selectedThana,
                                            isExpanded: true,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                //hint = '';
                                                _selectedThana = newValue;
                                                print(
                                                    "Accoutn no: " + _selectedThana.toString());
                                              });
                                            },
                                            items: thanaList
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: GoogleFonts.comfortaa(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(left: 10.0),
                                          decoration: BoxDecoration(
                                            // //color: Colors.white,
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //       //color: Colors.black,
                                            //   )
                                            // ],
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1),
                                          ),
                                          child: DropdownButton<String>(
                                            // Not necessary for Option 1
                                            underline: SizedBox(),
                                            hint: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text(
                                                'Select Word',
                                                style: GoogleFonts.comfortaa(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            value: _selectedWord,
                                            isExpanded: true,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                //hint = '';
                                                _selectedWord = newValue;
                                                print(
                                                    "Accoutn no: " + _selectedWord.toString());
                                              });
                                            },
                                            items: wordList
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: GoogleFonts.comfortaa(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w700,
                                                    )),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 5.0),
                                          child: TextField(
                                    //        controller: lastNameController,
                                            autofocus: false,
                                            cursorColor: Colors.black45,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true,
                                              prefixIcon: Icon(
                                                Icons.person,
                                                color: Colors.black45,
                                              ),
                                              labelText: "House no",
                                              hintText: 'house no',
                                            ),
                                            // The validator receives the text that the user has entered.
                                            // validator: (value) {
                                            //   if (value == null || value.isEmpty) {
                                            //     return 'Last name is required';
                                            //   } else if (value.length > 25) {
                                            //     return 'Maximum length is 25.';
                                            //   }
                                            //   return null;
                                            // },
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: TextField(
                                      //      controller: lastNameController,
                                            autofocus: false,
                                            cursorColor: Colors.black45,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true,
                                              prefixIcon: Icon(
                                                Icons.person,
                                                color: Colors.black45,
                                              ),
                                              labelText: "House no",
                                              hintText: 'house no',
                                            ),
                                            // The validator receives the text that the user has entered.
                                            // validator: (value) {
                                            //   if (value == null || value.isEmpty) {
                                            //     return 'Last name is required';
                                            //   } else if (value.length > 25) {
                                            //     return 'Maximum length is 25.';
                                            //   }
                                            //   return null;
                                            // },
                                          ),
                                        ),
                                      ),
                                    ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 5.0),
                                        child: TextField(
                                        //  controller: lastNameController,
                                          autofocus: false,
                                          cursorColor: Colors.black45,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            isDense: true,
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.black45,
                                            ),
                                            labelText: "Block no",
                                            hintText: 'Block no',
                                          ),
                                          // The validator receives the text that the user has entered.
                                          // validator: (value) {
                                          //   if (value == null || value.isEmpty) {
                                          //     return 'Last name is required';
                                          //   } else if (value.length > 25) {
                                          //     return 'Maximum length is 25.';
                                          //   }
                                          //   return null;
                                          // },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: TextField(
                                          //controller: lastNameController,
                                          autofocus: false,
                                          cursorColor: Colors.black45,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            isDense: true,
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.black45,
                                            ),
                                            labelText: "Flat no",
                                            hintText: 'Flat no',
                                          ),
                                          // The validator receives the text that the user has entered.
                                          // validator: (value) {
                                          //   if (value == null || value.isEmpty) {
                                          //     return 'Last name is required';
                                          //   } else if (value.length > 25) {
                                          //     return 'Maximum length is 25.';
                                          //   }
                                          //   return null;
                                          // },
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                Divider(),
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Date of birth', style: GoogleFonts.comfortaa(
                                        fontSize: 15,)),
                                    ),
                                    SizedBox(height: 8,),
                                    InkWell(
                                      onTap: () async{
                                        final newDate = await pickDate();
                                        if(newDate == null) return;
                                        final newDateTime = DateTime(
                                          newDate.year,
                                          newDate.month,
                                          newDate.day,

                                        );
                                        setState(() {
                                          startdate = newDateTime;

                                        });
                                        initialDateText = '${startdate!.year}-${startdate!.month}-${startdate!.day}';
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 1, color: Color(0XFFE8E8E8)),
                                        ),
                                        child:Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 15.0, left: 5.0),
                                                  child: Text(
                                                    initialDateText, style: GoogleFonts.comfortaa(
                                                    color: Colors.black54,
                                                    fontSize: 15,
                                                  ),
                                                  ),
                                                ),
                                                Icon(Icons.calendar_today_rounded,
                                                    size: 15,
                                                    color: Colors.black54),
                                              ]
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Occupation",
                                    hintText: 'what you are doing',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Religious",
                                    hintText: 'Which religious you are',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Marital status ?", style: GoogleFonts.comfortaa(fontSize: 15),)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Radio(
                                          value: 0,
                                          groupValue: marital_val,
                                          onChanged: _handleMaritalValueChange,
                                          activeColor: new Color(0xFF29A74A),
                                        ),
                                        Text('Married',
                                            style: GoogleFonts.comfortaa(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            )),
                                        Radio(
                                          value: 1,
                                          groupValue: marital_val,
                                          onChanged: _handleMaritalValueChange,
                                          activeColor: new Color(0xFF29A74A),
                                        ),
                                        Text('Single',
                                            style: GoogleFonts.comfortaa(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                TextField(
                                  ///controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Education",
                                    hintText: 'Educational Status',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "NID",
                                    hintText: 'Your NID no',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Email",
                                    hintText: 'your email id',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Contact",
                                    hintText: 'Mobile no',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Passport id",
                                    hintText: 'your passport id (optional)',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                // const SizedBox(height: 15),
                                // DropdownButtonFormField(
                                //   items: accountType.map((String item) {
                                //     return DropdownMenuItem(
                                //         value: item, child: Text(item));
                                //   }).toList(),
                                //   onChanged: (newValue) {
                                //     // do other stuff with _category
                                //     // setState(() => _category = newValue);
                                //   },
                                //   validator: (value) {
                                //     if (value == null) {
                                //       return 'Account type is required';
                                //     }
                                //     return null;
                                //   },
                                //   value: accountTypeController.text,
                                //   decoration: const InputDecoration(
                                //     hintText: "Select Account Type",
                                //     labelText: "Account Type",
                                //     // errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                                //   ),
                                // ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Step(
                        state: currentStep > 1
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep == 1 ? true : false,
                        title: const Text(""),
                        content: SingleChildScrollView(
                          child: Form(
                            key: _secondFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Family Information",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Divider(),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Emergency contact",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  // obscureText: true,
                                  // obscuringCharacter: '*',
                                  //controller: firstNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Name",
                                    hintText: 'person Name',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'First name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Relation",
                                    hintText: 'Relation with he/she',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Address",
                                    hintText: 'His/Her Address',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  //controller: lastNameController,
                                  autofocus: false,
                                  cursorColor: Colors.black45,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                    labelText: "Contact",
                                    hintText: 'Mobile no',
                                  ),
                                  // The validator receives the text that the user has entered.
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Last name is required';
                                  //   } else if (value.length > 25) {
                                  //     return 'Maximum length is 25.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Family/Mess member",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Divider(),
                                Form(
                                    child: Column(
                                  children: [
                                    for(int i = 1 ; i <= numberOfFamily ; i++)
                                    Container(
                                        child:Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "SL: "+i.toString(),
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            TextField(
                                              onChanged: (val)=>user.name = val,
                                              //controller: lastNameController,
                                              autofocus: false,
                                              cursorColor: Colors.black45,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true,
                                                prefixIcon: Icon(
                                                  Icons.person,
                                                  color: Colors.black45,
                                                ),
                                                labelText: "Name",
                                                hintText: 'Member name',
                                              ),
                                              // The validator receives the text that the user has entered.
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'Last name is required';
                                              //   } else if (value.length > 25) {
                                              //     return 'Maximum length is 25.';
                                              //   }
                                              //   return null;
                                              // },
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              onChanged: (val)=>user.age = val,
                                              //controller: lastNameController,
                                              autofocus: false,
                                              cursorColor: Colors.black45,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true,
                                                prefixIcon: Icon(
                                                  Icons.person,
                                                  color: Colors.black45,
                                                ),
                                                labelText: "Age",
                                                hintText: 'Member age',
                                              ),
                                              // The validator receives the text that the user has entered.
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'Last name is required';
                                              //   } else if (value.length > 25) {
                                              //     return 'Maximum length is 25.';
                                              //   }
                                              //   return null;
                                              // },
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              onChanged: (val)=>user.occupation = val,
                                              //controller: lastNameController,
                                              autofocus: false,
                                              cursorColor: Colors.black45,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true,
                                                prefixIcon: Icon(
                                                  Icons.person,
                                                  color: Colors.black45,
                                                ),
                                                labelText: "Ocupation",
                                                hintText: 'What he/she doing',
                                              ),
                                              // The validator receives the text that the user has entered.
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'Last name is required';
                                              //   } else if (value.length > 25) {
                                              //     return 'Maximum length is 25.';
                                              //   }
                                              //   return null;
                                              // },
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              onChanged: (val)=>user.contact = val,
                                              //controller: lastNameController,
                                              autofocus: false,
                                              cursorColor: Colors.black45,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true,
                                                prefixIcon: Icon(
                                                  Icons.person,
                                                  color: Colors.black45,
                                                ),
                                                labelText: "Contact",
                                                hintText: 'Mobile number',
                                              ),
                                              // The validator receives the text that the user has entered.
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'Last name is required';
                                              //   } else if (value.length > 25) {
                                              //     return 'Maximum length is 25.';
                                              //   }
                                              //   return null;
                                              // },
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                )),
                                Row(
                                  children: [
                                     Visibility(
                                      visible: numberOfFamily == 1? false:true,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: InkWell(
                                            onTap: (){
                                              numberOfFamily !=1?numberOfFamily--:numberOfFamily =1;
                                              setState(() {

                                              });
                                              //callDoctorLoginApi(mobileController.text, passwordController.text);
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => MobileVerificationScreen(generateOtp, mobileController.text.toString())));
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Container(
                                                width: 100,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: Colors.redAccent
                                                ),
                                                child: Center(
                                                  child: Text("Remove", style: GoogleFonts.comfortaa(color: Colors.white,fontSize: 10),),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: InkWell(
                                          onTap: (){
                                            numberOfFamily++;
                                            setState(() {
                                              _addcollections(user);
                                            });
                                            //callDoctorLoginApi(mobileController.text, passwordController.text);
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => MobileVerificationScreen(generateOtp, mobileController.text.toString())));
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: const Color(0xFF01A9B8)
                                              ),
                                              child: Center(
                                                child: Text("Add more", style: GoogleFonts.comfortaa(color: Colors.white,fontSize: 10),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Step(
                        state: currentStep > 2
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep == 2 ? true : false,
                        title: const Text(""),
                        content: SingleChildScrollView(
                          child: Form(
                            key: _thirdFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: const [
                                    Text(
                                      "House keeper",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Form(
                                    child: Column(
                                      children: [
                                        for(int j = 1 ; j <= numberOfHouseKeeper ; j++)
                                          Container(
                                              child:Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "SL: "+j.toString(),
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                  ),
                                                  TextField(
                                                    onChanged: (val)=>houseKeeper.name = val,
                                                    //controller: lastNameController,
                                                    autofocus: false,
                                                    cursorColor: Colors.black45,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      isDense: true,
                                                      prefixIcon: Icon(
                                                        Icons.person,
                                                        color: Colors.black45,
                                                      ),
                                                      labelText: "Name",
                                                      hintText: 'house keeper name',
                                                    ),
                                                    // The validator receives the text that the user has entered.
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Last name is required';
                                                    //   } else if (value.length > 25) {
                                                    //     return 'Maximum length is 25.';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                  const SizedBox(height: 10),
                                                  TextField(
                                                    onChanged: (val)=>houseKeeper.nid = val,
                                                    //controller: lastNameController,
                                                    autofocus: false,
                                                    cursorColor: Colors.black45,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      isDense: true,
                                                      prefixIcon: Icon(
                                                        Icons.person,
                                                        color: Colors.black45,
                                                      ),
                                                      labelText: "NID",
                                                      hintText: 'house keeper nid',
                                                    ),
                                                    // The validator receives the text that the user has entered.
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Last name is required';
                                                    //   } else if (value.length > 25) {
                                                    //     return 'Maximum length is 25.';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                  const SizedBox(height: 10),
                                                  TextField(
                                                    onChanged: (val)=>houseKeeper.area = val,
                                                    //controller: lastNameController,
                                                    autofocus: false,
                                                    cursorColor: Colors.black45,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      isDense: true,
                                                      prefixIcon: Icon(
                                                        Icons.person,
                                                        color: Colors.black45,
                                                      ),
                                                      labelText: "Area",
                                                      hintText: 'house keeper area',
                                                    ),
                                                    // The validator receives the text that the user has entered.
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Last name is required';
                                                    //   } else if (value.length > 25) {
                                                    //     return 'Maximum length is 25.';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                  const SizedBox(height: 10),
                                                  TextField(
                                                    onChanged: (val)=>houseKeeper.contact = val,
                                                    //controller: lastNameController,
                                                    autofocus: false,
                                                    cursorColor: Colors.black45,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      isDense: true,
                                                      prefixIcon: Icon(
                                                        Icons.person,
                                                        color: Colors.black45,
                                                      ),
                                                      labelText: "Contact",
                                                      hintText: 'Mobile number',
                                                    ),
                                                    // The validator receives the text that the user has entered.
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Last name is required';
                                                    //   } else if (value.length > 25) {
                                                    //     return 'Maximum length is 25.';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                ],
                                              )
                                          )
                                      ],
                                    )),
                                Row(
                                  children: [
                                    Visibility(
                                      visible: numberOfHouseKeeper == 1? false:true,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: InkWell(
                                            onTap: (){
                                              numberOfHouseKeeper !=1?numberOfHouseKeeper--:numberOfHouseKeeper =1;
                                              setState(() {

                                              });
                                              //callDoctorLoginApi(mobileController.text, passwordController.text);
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => MobileVerificationScreen(generateOtp, mobileController.text.toString())));
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Container(
                                                width: 100,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: Colors.redAccent
                                                ),
                                                child: Center(
                                                  child: Text("Remove", style: GoogleFonts.comfortaa(color: Colors.white,fontSize: 10),),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: InkWell(
                                          onTap: (){
                                            numberOfHouseKeeper++;
                                            setState(() {
                                              _addcollections2(houseKeeper);
                                            });
                                            //callDoctorLoginApi(mobileController.text, passwordController.text);
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => MobileVerificationScreen(generateOtp, mobileController.text.toString())));
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: const Color(0xFF01A9B8)
                                              ),
                                              child: Center(
                                                child: Text("Add more", style: GoogleFonts.comfortaa(color: Colors.white,fontSize: 10),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Step(
                        state: currentStep > 3
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep == 3 ? true : false,
                        title: const Text(""),
                        content: SingleChildScrollView(
                          child: Form(
                            key: _forthFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: const [
                                    Text(
                                      "Caretaker Information",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Form(
                                    child: Column(
                                      children: [
                                        for(int k = 1 ; k <= numberOfCareTaker ; k++)
                                          Container(
                                              child:Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "SL: "+k.toString(),
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                  ),
                                                  TextField(
                                                    onChanged: (val)=>careTaker.name = val,
                                                    //controller: lastNameController,
                                                    autofocus: false,
                                                    cursorColor: Colors.black45,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      isDense: true,
                                                      prefixIcon: Icon(
                                                        Icons.person,
                                                        color: Colors.black45,
                                                      ),
                                                      labelText: "Name",
                                                      hintText: 'Member name',
                                                    ),
                                                    // The validator receives the text that the user has entered.
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Last name is required';
                                                    //   } else if (value.length > 25) {
                                                    //     return 'Maximum length is 25.';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                  const SizedBox(height: 10),
                                                  TextField(
                                                    onChanged: (val)=>careTaker.nid = val,
                                                    //controller: lastNameController,
                                                    autofocus: false,
                                                    cursorColor: Colors.black45,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      isDense: true,
                                                      prefixIcon: Icon(
                                                        Icons.person,
                                                        color: Colors.black45,
                                                      ),
                                                      labelText: "Age",
                                                      hintText: 'Member age',
                                                    ),
                                                    // The validator receives the text that the user has entered.
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Last name is required';
                                                    //   } else if (value.length > 25) {
                                                    //     return 'Maximum length is 25.';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                  const SizedBox(height: 10),
                                                  TextField(
                                                    onChanged: (val)=>careTaker.area = val,
                                                    //controller: lastNameController,
                                                    autofocus: false,
                                                    cursorColor: Colors.black45,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      isDense: true,
                                                      prefixIcon: Icon(
                                                        Icons.person,
                                                        color: Colors.black45,
                                                      ),
                                                      labelText: "Ocupation",
                                                      hintText: 'What he/she doing',
                                                    ),
                                                    // The validator receives the text that the user has entered.
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Last name is required';
                                                    //   } else if (value.length > 25) {
                                                    //     return 'Maximum length is 25.';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                  const SizedBox(height: 10),
                                                  TextField(
                                                    onChanged: (val)=>careTaker.contact = val,
                                                    //controller: lastNameController,
                                                    autofocus: false,
                                                    cursorColor: Colors.black45,
                                                    decoration: const InputDecoration(
                                                      border: OutlineInputBorder(),
                                                      isDense: true,
                                                      prefixIcon: Icon(
                                                        Icons.person,
                                                        color: Colors.black45,
                                                      ),
                                                      labelText: "Contact",
                                                      hintText: 'Mobile number',
                                                    ),
                                                    // The validator receives the text that the user has entered.
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Last name is required';
                                                    //   } else if (value.length > 25) {
                                                    //     return 'Maximum length is 25.';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                ],
                                              )
                                          )
                                      ],
                                    )),
                                Row(
                                  children: [
                                    Visibility(
                                      visible: numberOfCareTaker == 1? false:true,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: InkWell(
                                            onTap: (){
                                              numberOfCareTaker !=1?numberOfCareTaker--:numberOfCareTaker =1;
                                              setState(() {

                                              });
                                              //callDoctorLoginApi(mobileController.text, passwordController.text);
                                              //Navigator.push(context, MaterialPageRoute(builder: (context) => MobileVerificationScreen(generateOtp, mobileController.text.toString())));
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Container(
                                                width: 100,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: Colors.redAccent
                                                ),
                                                child: Center(
                                                  child: Text("Remove", style: GoogleFonts.comfortaa(color: Colors.white,fontSize: 10),),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: InkWell(
                                          onTap: (){
                                            numberOfCareTaker++;
                                            setState(() {
                                              _addcollections3(careTaker);
                                            });
                                            //callDoctorLoginApi(mobileController.text, passwordController.text);
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => MobileVerificationScreen(generateOtp, mobileController.text.toString())));
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: const Color(0xFF01A9B8)
                                              ),
                                              child: Center(
                                                child: Text("Add more", style: GoogleFonts.comfortaa(color: Colors.white,fontSize: 10),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Step(
                        isActive: currentStep == 4 ? true : false,
                        title: const Text(""),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: const [
                                  Text(
                                    "Additional Information",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                // obscureText: true,
                                // obscuringCharacter: '*',
                                //controller: firstNameController,
                                autofocus: false,
                                cursorColor: Colors.black45,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black45,
                                  ),
                                  labelText: "First Name",
                                  hintText: 'Name...',
                                ),
                                // The validator receives the text that the user has entered.
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'First name is required';
                                //   } else if (value.length > 25) {
                                //     return 'Maximum length is 25.';
                                //   }
                                //   return null;
                                // },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                //controller: lastNameController,
                                autofocus: false,
                                cursorColor: Colors.black45,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black45,
                                  ),
                                  labelText: "Last Name",
                                  hintText: 'Name...',
                                ),
                                // The validator receives the text that the user has entered.
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Last name is required';
                                //   } else if (value.length > 25) {
                                //     return 'Maximum length is 25.';
                                //   }
                                //   return null;
                                // },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                //controller: lastNameController,
                                autofocus: false,
                                cursorColor: Colors.black45,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black45,
                                  ),
                                  labelText: "Last Name",
                                  hintText: 'Name...',
                                ),
                                // The validator receives the text that the user has entered.
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Last name is required';
                                //   } else if (value.length > 25) {
                                //     return 'Maximum length is 25.';
                                //   }
                                //   return null;
                                // },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                //controller: lastNameController,
                                autofocus: false,
                                cursorColor: Colors.black45,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black45,
                                  ),
                                  labelText: "Last Name",
                                  hintText: 'Name...',
                                ),
                                // The validator receives the text that the user has entered.
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Last name is required';
                                //   } else if (value.length > 25) {
                                //     return 'Maximum length is 25.';
                                //   }
                                //   return null;
                                // },
                              ),
                              const SizedBox(height: 20),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
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
                    child: Text('Congratulation',style: GoogleFonts.comfortaa(
                        fontSize: 18
                    )),
                  )),
                  // Align(
                  //     alignment: Alignment.centerRight,
                  //     child: GestureDetector(
                  //         onTap: (){
                  //           Navigator.pop(context, false);
                  //         },
                  //         child: Icon(Icons.cancel_outlined))),
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
                    child: Text('You are successfully registered. Please enjoy our service !',
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage('true')));
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
                    child: Text('Continue', textAlign: TextAlign.center,style: GoogleFonts.comfortaa(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,) ),
                  ),
                ),
              )
            ],
          );
        });
  }

  void _handleRoleValueChange(int? value) {
    setState(() {
      role_val = value!;
      print('kDklcjlKCl '+ roleValue.toString());
      switch (value) {
        case 0:
          roleValue = "Owner";
          break;
        case 1:
          roleValue = "Renter";
          break;
      }
    });
  }

  void _handleSubRoleValueChange(int? value) {
    setState(() {
      subRole_val = value!;
      print('kDklcjlKCl '+ subRoleValue.toString());
      switch (value) {
        case 0:
          subRoleValue = "Family";
          break;
        case 1:
          subRoleValue = "Sublet";
          break;
        case 2:
          subRoleValue = "Mess";
          break;
      }
    });
  }

  void _handleMaritalValueChange(int? value) {
    setState(() {
      marital_val = value!;
      print('kDklcjlKCl '+ maritalValue.toString());
      switch (value) {
        case 0:
          maritalValue = "Married";
          break;
        case 1:
          maritalValue = "Single";
          break;
      }
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1990),
    lastDate: DateTime(2050),
  );

  void _addcollections(FamilyMember user) {
    setState(() {
      familyMemberList.add(user);
      this.user = new FamilyMember();
    });
    print("member data: "+ familyMemberList.toList().toString());
}
  void _addcollections2(HouseKeeper houseKeeper) {
    setState(() {
      houseKeeperList.add(houseKeeper);
      this.houseKeeper = new HouseKeeper();
    });
    print("member data: "+ houseKeeperList.toList().toString());
  }
  void _addcollections3(CareTaker careTaker) {
    setState(() {
      careTakerList.add(careTaker);
      this.careTaker = new CareTaker();
    });
    print("member data: "+ careTakerList.toList().toString());
  }
}