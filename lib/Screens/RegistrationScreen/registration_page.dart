import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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

  void shopForm() async {
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

  void extraForm1() async {
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
  void extraForm2() async {
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

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
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
                                      onPressed: () => shopForm(),
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
                                      onPressed: () => extraForm1(),
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
                                      onPressed: () => extraForm2(),
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
                                const SizedBox(height: 12),
                                TextField(
                                  // obscureText: true,
                                  // obscuringCharacter: '*',
                                  controller: firstNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                Row(
                                  children: const [
                                    Text(
                                      "Family Information",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                TextField(
                                  // obscureText: true,
                                  // obscuringCharacter: '*',
                                  controller: firstNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                TextField(
                                  // obscureText: true,
                                  // obscuringCharacter: '*',
                                  controller: firstNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                TextField(
                                  // obscureText: true,
                                  // obscuringCharacter: '*',
                                  controller: firstNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                  controller: lastNameController,
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
                                controller: firstNameController,
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
                                controller: lastNameController,
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
                                controller: lastNameController,
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
                                controller: lastNameController,
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
}