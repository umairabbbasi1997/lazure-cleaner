import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/model/UserResponse.dart';
import 'package:lazure_cleaner/utils/constants.dart';

import '../api_service/api_services.dart';
import '../utils/local_storage_service.dart';

class ChangePasswordController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> changePassword( BuildContext context) async {



    if (passwordController.text.toString().isEmpty  ||
        newPasswordController.text.toString().isEmpty||
        confirmPasswordController.text.toString().isEmpty
    ) {
      Get.snackbar("Error", "All fields is required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);

      return false;
    }



    if(newPasswordController.text.toString().length < 6)
    {
      Get.snackbar("Error", "Password must be 6 character long",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      return false;
    }
    if(confirmPasswordController.text.toString() != newPasswordController.text.toString())
    {
      Get.snackbar("Error", "New Password & Confirm Password doesn't match",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      return false;
    }


    else
    {
      Map<String,String> param =
      {"old_password":passwordController.text.toString(),
        "password":newPasswordController.text.toString(),
        "confirm_password":confirmPasswordController.text.toString()
      };
      var response = await ApiService().post(Constants.CHANGE_PASSWORD_URL,context,body: param);

      var  succes = jsonDecode(response.body)['success'];


      if(!succes)
      {


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
