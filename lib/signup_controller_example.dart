import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/routes_constants.dart';


class SignupControllerExample extends GetxController {
  var signupFormKey = GlobalKey<FormState>();
  RxMap<String, bool> isActiveField = {
    "name": false,
    "email": false,
    "password": false,
    "confirm password": false
  }.obs;
  RxBool passwordObsecure = true.obs;
  RxBool confirmPasswordObsecure = true.obs;
  RxBool isLoading = false.obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  Rx<FocusNode> f1 = FocusNode().obs;
  Rx<FocusNode> f2 = FocusNode().obs;
  Rx<FocusNode> f3 = FocusNode().obs;
  Rx<FocusNode> f4 = FocusNode().obs;



  activeNameBorder(isActive) {
    isActiveField.forEach((key, value) {
      key == "name"
          ? isActiveField[key] = isActive
          : isActiveField[key] = false;
    });
    f1.value.requestFocus();
  }

  activeEmailBorder(isActive) {
    isActiveField.forEach((key, value) {
      key == "email"
          ? isActiveField[key] = isActive
          : isActiveField[key] = false;
    });
    f2.value.requestFocus();
  }

  activePasswordBorder(isActive) {
    isActiveField.forEach((key, value) {
      key == "password"
          ? isActiveField[key] = isActive
          : isActiveField[key] = false;
    });
    f3.value.requestFocus();
  }

  activeConfirmPasswordBorder(isActive) {
    isActiveField.forEach((key, value) {
      key == "confirm password"
          ? isActiveField[key] = isActive
          : isActiveField[key] = false;
    });
    f4.value.requestFocus();
  }

  void submit() async {
    signupFormKey.currentState!.validate();
    if (signupFormKey.currentState!.validate()) {







      // title: Image.asset(ImagePathConstants.appLogo, scale: 8),
      // content: Text("Something here", textAlign: TextAlign.center),
      // actions: [
      //   ElevatedButton(onPressed: () {}, child: Text("OK")),
      // ],
      // _requestApi();
      // print(
      //     "name: ${nameController.value.text}\nemail: ${emailController.value.text}\npassword: ${passwordController.value.text}");
      // Get.toNamed(Routes.otpScreen, arguments: {'isSignup': true});
    }
  }

  @override
  void onClose() {
    // ignore: invalid_use_of_protected_member
    if (signupFormKey.currentContext != null) {
      signupFormKey.currentState!.dispose();
    }
    super.onClose();
  }
}
