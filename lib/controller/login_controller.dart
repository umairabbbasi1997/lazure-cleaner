import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loginRequest() {



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
        return true;
      }
  }
}
