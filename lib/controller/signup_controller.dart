import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  bool signupRequest()
  {

    if (firstNameController.text.toString().isEmpty) {
      Get.snackbar("Error", "First name is required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);

      return false;
    }
    if (lastNameController.text.toString().isEmpty) {
      Get.snackbar("Error", "Last name is required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);

      return false;
    }
    if (mobileNoController.text.toString().isEmpty) {
      Get.snackbar("Error", "Mobile number is required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);

      return false;
    }
    if (emailController.text.toString().isEmpty ) {
      Get.snackbar("Error", "Email is required",
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
    if (passwordController.text.toString().isEmpty ) {
      Get.snackbar("Error", "Password is required",
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
    if (cnicController.text.toString().isEmpty) {
      Get.snackbar("Error", "CNIC is required",
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