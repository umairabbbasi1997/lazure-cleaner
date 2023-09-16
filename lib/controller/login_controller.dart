import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/model/UserResponse.dart';
import 'package:lazure_cleaner/utils/constants.dart';

import '../api_service/api_services.dart';
import '../utils/local_storage_service.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  Future<bool> loginRequest( BuildContext context) async {


    debugPrint("cntrl: "+emailController.text.toString());
    if (emailController.text.toString().isEmpty ||
        passwordController.text.toString().isEmpty ) {
      Get.snackbar("Error", "Email/Password is required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);

      return false;
    }

    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text.toString());
    if(!emailValid)
    {
      Get.snackbar("Error", "Incorrect email format",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      return false;
    }

    if(passwordController.text.toString().length < 6)
    {
      Get.snackbar("Error", "Password must be 6 characters long",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      return false;
    }

      else
      {
           Map<String,String> param = {"login_field":emailController.text.toString(),"password":passwordController.text.toString()};
        var response = await ApiService().post(Constants.loginURL,context,body: param);

        var  succes = jsonDecode(response.body)['sucess'] ?? false;

        if(succes)
          {

            var jsonResult = jsonDecode(response.body)['data'];


            var user = UserResponse.fromJson(jsonResult);
            String userString = jsonEncode(user);

            await LocalStorageService().save(Constants.currentUser,userString);
            var  token = jsonDecode(response.body)['token'];


            await LocalStorageService().save(Constants.jwToken,token);

            debugPrint("succes: "+succes.toString()+"token: "+token);

          }
        else{

          var  message = jsonDecode(response.body)['message'];

          Get.snackbar("Error", message,
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.red);
        }

        return succes;
      }
  }


}
