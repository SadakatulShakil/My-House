import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkCall {
  final String baseUrl = "http://medical-application.comjagat.org/";
  final String loginUrl = "PostpaidApi/getLoginData/";
  final String apiKey = "cStSLnzMq2fo5LARbLAUiULslVJiWFRCkqwN6VsK7Xg6m19h3WgwWBv23eer8kl7DIEh";
//
//   Future<DoctorList?> getDoctorList(String hId, String dId) async {
//     String fullUrl = baseUrl+"api/doctor-list"+'?hospital_id=$hId&department_id=$dId';
//     final doctorListData = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },);
//     print("doctorList_URL = " + fullUrl);
//     print("doctorList_Response = " + doctorListData.body);
//     if (doctorListData.statusCode == 200) {
//       return DoctorList.fromJson(jsonDecode(doctorListData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<HospitalList?> getHospitalList() async {
//     String fullUrl = baseUrl+"api/hospital-list";
//     final hospitalListData = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },);
//     print("hospitalList_URL = " + fullUrl);
//     print("hospitalList_Response = " + hospitalListData.body);
//     if (hospitalListData.statusCode == 200) {
//       return HospitalList.fromJson(jsonDecode(hospitalListData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<DepartmentList?> getDepartmentList() async {
//     String fullUrl = baseUrl+"api/department-list";
//     final hospitalListData = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },);
//     print("departmentList_URL = " + fullUrl);
//     print("departmentList_Response = " + hospitalListData.body);
//     if (hospitalListData.statusCode == 200) {
//       return DepartmentList.fromJson(jsonDecode(hospitalListData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<DepartmentList?> getDepartmentListByHospital(int id) async {
//    int hospital_id = id;
//     String fullUrl = baseUrl+"api/hospitals-department-list"+'?hospital_id=$hospital_id';
//     final departmentListByHospitalData = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//     );
//     print("departmentListByHospitalData_URL = " + fullUrl);
//     print("departmentListByHospitalData_Response = " + departmentListByHospitalData.body);
//     if (departmentListByHospitalData.statusCode == 200) {
//       return DepartmentList.fromJson(jsonDecode(departmentListByHospitalData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<HospitalList?> getHospitalListByDepartment(int id) async {
//     int department_id = id;
//     String fullUrl = baseUrl+"api/hospital-list-by-department"+'?department_id=$department_id';
//     final hospitalListByDepartmentData = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//     );
//     print("hospitalListByDepartmentData_URL = " + fullUrl);
//     print("hospitalListByDepartmentData_Response = " + hospitalListByDepartmentData.body);
//     if (hospitalListByDepartmentData.statusCode == 200) {
//       return HospitalList.fromJson(jsonDecode(hospitalListByDepartmentData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<LabTestList?> getDlabTestList() async {
//     String fullUrl = baseUrl+"api/diagnostic-test-list";
//     final labTestListData = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },);
//     print("labTestListData_URL = " + fullUrl);
//     print("labTestListData_Response = " + labTestListData.body);
//     if (labTestListData.statusCode == 200) {
//       return LabTestList.fromJson(jsonDecode(labTestListData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<LabHospitalList?> getHospitalListByLabTest(int id) async {
//     int test_id = id;
//     String fullUrl = baseUrl+"api/hospital-list-by-lab-test"+'?test_id=$test_id';
//     final hospitalListByLabTestData = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//     );
//     print("hospitalListByLabTestData_URL = " + fullUrl);
//     print("hospitalListByLabTestData_Response = " + hospitalListByLabTestData.body);
//     if (hospitalListByLabTestData.statusCode == 200) {
//       return LabHospitalList.fromJson(jsonDecode(hospitalListByLabTestData.body));
//     } else {
//       return null;
//     }
//   }
//   Future<HospitalBook?> postHospitalBooking(
//       String id,
//       String patientValue,
//       String selectedSurName,
//       String patientName,
//       String careOf,
//       String age,
//       String currentLocation,
//       String presentLocation,
//       String caseSummery,
//       String initialDateText,
//       String sexValue,
//       String selectedCabinCriteria,
//       String incentiveValue,
//       String emergencyContact,
//       String optionalContact
//       ) async {
//
//     var body = jsonEncode({
//       "hospital_id": id,
//       "patient_type": patientValue,
//       "name": selectedSurName+' '+patientName,
//       "care_of": careOf,
//       "age": age,
//       "current_location": currentLocation,
//       "present_address": presentLocation,
//       "case_summary": caseSummery,
//       "admission_date": initialDateText,
//       "gender": sexValue,
//       "cabin_type": selectedCabinCriteria,
//       "incentive_care": incentiveValue,
//       "emergency_mobile": emergencyContact,
//       "other_mobile": optionalContact
//     });
//
//     String fullUrl = baseUrl+'api/hospital-admission';
//     print("URL = " + fullUrl);
//     print("formData = " + body.toString());
//
//     final hospitalBookingData = await http.post(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//       body: body,
//     );
//     print("URL = " + fullUrl);
//     print("hospitalBookingData res = " + hospitalBookingData.body);
//     if (hospitalBookingData.statusCode == 200) {
//       return HospitalBook.fromJson(jsonDecode(hospitalBookingData.body));
//     } else {
//       return null;
//     }
//   }
//   Future<TestBooking?> postTestBooking(
//       String hospital_id,
//       String test_id,
//       String surname,
//       String patientName,
//       String age,
//       String serviceValue,
//       String parentLocation,
//       String initialDateText,
//       String emergencyContact,
//       String emailAddress,
//       String price,
//       String discount,
//       String afterDiscountPrice
//       ) async {
//
//     var body = jsonEncode({
//       "hospital_id": hospital_id,
//       "diagnostic_test_id": test_id,
//       "name": surname+' '+patientName,
//       "service_criteria": serviceValue,
//       "age": age,
//       "address": parentLocation,
//       "test_date": initialDateText,
//       "emergency_mobile": emergencyContact,
//       "email": emailAddress,
//       "price": price,
//       "discount": discount,
//       "after_discount": afterDiscountPrice
//     });
//
//     String fullUrl = baseUrl+'api/book-lab-test';
//     print("URL = " + fullUrl);
//     print("formData = " + body.toString());
//
//     final testBookingData = await http.post(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//       body: body,
//     );
//     print("URL = " + fullUrl);
//     print("TestBooking res = " + testBookingData.body);
//     if (testBookingData.statusCode == 200) {
//       return TestBooking.fromJson(jsonDecode(testBookingData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<AmbulanceBooking?> postAmbulanceBooking(
//       String surname,
//       String name,
//       String destination,
//       String presentLocation,
//       String emergencyContact,
//       String ambulanceCriteria,
//       String doctorOption,
//       String boyOption,
//       String price,
//       String discount,
//       String afterDixcountPrice,
//       String dateTime
//       ) async {
//
//     var body = jsonEncode({
//       "name": surname+' '+name,
//       "destination": destination,
//       "address": presentLocation,
//       "mobile": emergencyContact,
//       "criteria": ambulanceCriteria,
//       "doctor_option": doctorOption,
//       "boy_option": boyOption,
//       "price": price,
//       "discount": discount,
//       "after_discount": afterDixcountPrice,
//       "advance_booking_date": dateTime
//     });
//
//     String fullUrl = baseUrl+'api/book-ambulance';
//     print("URL = " + fullUrl);
//     print("formData = " + body.toString());
//
//     final ambulanceBookingData = await http.post(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//       body: body,
//     );
//     print("URL = " + fullUrl);
//     print("ambulanceBooking res = " + ambulanceBookingData.body);
//     if (ambulanceBookingData.statusCode == 200) {
//       return AmbulanceBooking.fromJson(jsonDecode(ambulanceBookingData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<DoctorAppointmentResponse?> postAppointmentBooking(
//       String id,
//       String chamber_id,
//       String surName,
//       String name,
//       String address,
//       String contact,
//       String date,
//       String time,
//       String price,
//       String discount,
//       String afterDiscount
//       ) async {
//
//     var body = jsonEncode({
//       "doctor_id": id,
//       "chamber_id": chamber_id,
//       "name": surName+' '+name,
//       "address": address,
//       "emergency_mobile": contact,
//       "appointment_date": date,
//       "appointment_time": time,
//       "price": price,
//       "discount": discount,
//       "after_discount": afterDiscount,
//
//     });
//
//     String fullUrl = baseUrl+'api/book-appointment';
//     print("URL = " + fullUrl);
//     print("formData = " + body.toString());
//
//     final DoctorAppointmentData = await http.post(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//       body: body,
//     );
//     print("URL = " + fullUrl);
//     print("ambulanceBooking res = " + DoctorAppointmentData.body);
//     if (DoctorAppointmentData.statusCode == 200) {
//       return DoctorAppointmentResponse.fromJson(jsonDecode(DoctorAppointmentData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<NurseBooking?> postNurseBooking(
//       String serviceName,
//       String hospitalName,
//       String surName,
//       String working_place,
//       String name,
//       String caseSummery,
//       String startDate,
//       String endDate,
//       String email,
//       String contact
//       ) async {
//     var body = jsonEncode({
//       "service_name": serviceName,
//       "patient_name": surName + ' ' + name,
//       "working_place": working_place,
//       "hospital_name": hospitalName,
//       "mobile": contact,
//       "case_summery": caseSummery,
//       "service_start_date": startDate,
//       "service_end_date": endDate,
//       "email": email
//     });
//
//     String fullUrl = baseUrl + 'api/nurse-and-others-attendance';
//     print("URL = " + fullUrl);
//     print("formData = " + body.toString());
//
//     final nurseBookingData = await http.post(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//       body: body,
//     );
//     print("URL = " + fullUrl);
//     print("nurseBooking res = " + nurseBookingData.body);
//     if (nurseBookingData.statusCode == 200) {
//       return NurseBooking.fromJson(jsonDecode(nurseBookingData.body));
//     } else {
//       return null;
//     }
//   }
//
//
//   /// doctor register api
//
//   Future<RegistrationResponse?> postDoctorRegistration(
//       String name,
//       String mobile,
//       String password,
//       ) async {
//
//     var body = jsonEncode({
//       "name": name,
//       "mobile": mobile,
//       "password": password,
//     });
//
//     String fullUrl = baseUrl+'api/doctor-register';
//     print("URL = " + fullUrl);
//     print("formData = " + body.toString());
//
//     final doctorRegisterData = await http.post(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//       body: body,
//     );
//     print("URL = " + fullUrl);
//     print("doctorRegisterData res = " + doctorRegisterData.headers['token'].toString());
//     if (doctorRegisterData.statusCode == 200) {
//       return RegistrationResponse.fromJson(jsonDecode(doctorRegisterData.body));
//     } else {
//       return null;
//     }
//   }
//
// /// doctor login api
//
// Future<DoctorLoginResponse?> postDoctorLogin(
//     String mobile,
//     String password,
//     ) async {
//
//   var body = jsonEncode({
//     "mobile": mobile,
//     "password": password,
//   });
//
//   String fullUrl = baseUrl+'api/doctor-login';
//   print("URL = " + fullUrl);
//   print("formData = " + body.toString());
//
//   final doctorLoginData = await http.post(Uri.parse(fullUrl),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Accept': 'application/json',
//       'key': apiKey,
//     },
//     body: body,
//   );
//   print("URL = " + fullUrl);
//   print("doctorLoginData res = " + doctorLoginData.body);
//   if (doctorLoginData.statusCode == 200) {
//     return DoctorLoginResponse.fromJson(jsonDecode(doctorLoginData.body));
//   } else {
//     return null;
//   }
// }
//
//   Future<RegistrationResponse?> postPatientRegistration(
//       String name,
//       String mobile,
//       String password,
//       ) async {
//
//     var body = jsonEncode({
//       "name": name,
//       "mobile": mobile,
//       "password": password,
//     });
//
//     String fullUrl = baseUrl+'api/user-register';
//     print("URL = " + fullUrl);
//     print("formData = " + body.toString());
//
//     final doctorRegisterData = await http.post(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//       body: body,
//     );
//     print("URL = " + fullUrl);
//     print("doctorRegisterData res = " + doctorRegisterData.headers['token'].toString());
//     if (doctorRegisterData.statusCode == 200) {
//       return RegistrationResponse.fromJson(jsonDecode(doctorRegisterData.body));
//     } else {
//       return null;
//     }
//   }
//
//   /// doctor login api
//
//   Future<PatientLoginResponse?> postPatientLogin(
//       String mobile,
//       String password,
//       ) async {
//
//     var body = jsonEncode({
//       "mobile": mobile,
//       "password": password,
//     });
//
//     String fullUrl = baseUrl+'api/user-login';
//     print("URL = " + fullUrl);
//     print("formData = " + body.toString());
//
//     final doctorLoginData = await http.post(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//       body: body,
//     );
//     print("URL = " + fullUrl);
//     print("doctorLoginData res = " + doctorLoginData.body);
//     if (doctorLoginData.statusCode == 200) {
//       return PatientLoginResponse.fromJson(jsonDecode(doctorLoginData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<DoctorDetails?> getDoctorDetails(int id) async {
//     String fullUrl = baseUrl+"api/doctor-details"+'?id=$id';
//     final hospitalListByDepartmentData = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//       },
//     );
//     print("hospitalListByDepartmentData_URL = " + fullUrl);
//     print("hospitalListByDepartmentData_Response = " + hospitalListByDepartmentData.body);
//     if (hospitalListByDepartmentData.statusCode == 200) {
//       return DoctorDetails.fromJson(jsonDecode(hospitalListByDepartmentData.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<AppointmentHistory?> getAppointmentHistory(String token) async {
//     String fullUrl = baseUrl+"api/patient-appointment-history";
//     final appointmentHistory = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//         'access-token': token,
//       },);
//     print("appointmentHistory_URL = " + fullUrl);
//     print("appointmentHistory_Response = " + appointmentHistory.body);
//     if (appointmentHistory.statusCode == 200) {
//       return AppointmentHistory.fromJson(jsonDecode(appointmentHistory.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<HospitalBookingHistory?> getHospitalBookingHistory(String token) async {
//     String fullUrl = baseUrl+"api/hospital-admission-list";
//     final hospitalBookingHistory = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//         'access-token': token,
//       },);
//     print("hospitalBookingHistory_URL = " + fullUrl);
//     print("hospitalBookingHistory_Response = " + hospitalBookingHistory.body);
//     if (hospitalBookingHistory.statusCode == 200) {
//       return HospitalBookingHistory.fromJson(jsonDecode(hospitalBookingHistory.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<AmbulanceBookingHistory?> getAmbulanceBookingHistory(String token) async {
//     String fullUrl = baseUrl+"api/ambulance-booking-list";
//     final hospitalBookingHistory = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//         'access-token': token,
//       },);
//     print("hospitalBookingHistory_URL = " + fullUrl);
//     print("hospitalBookingHistory_Response = " + hospitalBookingHistory.body);
//     if (hospitalBookingHistory.statusCode == 200) {
//       return AmbulanceBookingHistory.fromJson(jsonDecode(hospitalBookingHistory.body));
//     } else {
//       return null;
//     }
//   }
//
//   Future<NurseBookingHistory?> getNurseBookingHistory(String token) async {
//     String fullUrl = baseUrl+"api/nurse-and-others-attendance-booking-list";
//     final hospitalBookingHistory = await http.get(Uri.parse(fullUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Accept': 'application/json',
//         'key': apiKey,
//         'access-token': token,
//       },);
//     print("hospitalBookingHistory_URL = " + fullUrl);
//     print("hospitalBookingHistory_Response = " + hospitalBookingHistory.body);
//     if (hospitalBookingHistory.statusCode == 200) {
//       return NurseBookingHistory.fromJson(jsonDecode(hospitalBookingHistory.body));
//     } else {
//       return null;
//     }
 // }
}
