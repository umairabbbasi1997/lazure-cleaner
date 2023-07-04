import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loginRequest() {

    debugPrint("cntrl: "+emailController.text.toString());
    if (emailController.text.toString().isEmpty ||
        passwordController.text.toString().isEmpty) {
      Get.snackbar("Error", "Email/Password is required",
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
