import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projects/models/login_model.dart';
import 'dart:convert';

import 'package:projects/models/registration_model.dart';

class BlueHostService{
  static Future getLogin(LoginModel model) async{
    var APIURLLogin = 'https://beta.lzycrazy.com/login-api';
    http.Response response = await http.post(Uri.parse(APIURLLogin),body: model.toMap())
        .then((value) => value).catchError((error) => print("LazyCrazy Failed to getLogin: $error"));
    var data = jsonDecode(response.body);
    print("getLogin DATA: ${data}");
  }
  static Future<int> getRegistration(RegistrationModel model) async{
    var APIURLRegistration = 'https://beta.lzycrazy.com/register-api';
    http.Response response = await http.post(Uri.parse(APIURLRegistration),body: model.toMap())
        .then((value) => value).catchError((error) => print("LazyCrazy Failed to getRegistration: $error"));
    var data = jsonDecode(response.body);
    print("getRegistration DATA: ${data}");
    return 1;
  }
}
// Future RegistrationUser() async {
//   var APIURL = "http://192.168.1.2/xxxxxxxxx/api/xxxxxxx.php";
//
//   Map mapeddate = {
//     'name': _name.text,
//     'phone': _phone.text,
//     'email': _email.text,
//     'pass': _pass1.text,
//     'type': "applicant",
//   };
//   print("JSON DATA: $mapeddate");
//
//   http.Response response =
//   await http.post(Uri.parse(APIURL), body: mapeddate);
//
//   var data = jsonDecode(response.body);
//
//   print("DATA: ${data}");
// }
// }