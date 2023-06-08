import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';
import 'package:lazure_cleaner/signup_controller.dart';
import 'package:lazure_cleaner/utils/form_validator.dart';
import 'package:lazure_cleaner/widgets/large_elevated_button_widget.dart';
import 'package:lazure_cleaner/widgets/my_text_field.dart';

import '../constants/image_path_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    var isYesChecked = false;
    var isNoChecked = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/app_background.jpg")
              )
          ),
          margin:
          const EdgeInsets.only(top: 180, left: 25, right: 25, bottom: 20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      labelText: "Username or Email",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 10),
              child: Text(
                  "Forgot password?",
                textAlign: TextAlign.left,
              ),
              ),

              Padding(padding: EdgeInsets.only(top: 60),
                child:SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(navHome);
                    },
                    child:
                      Text("Confirm"
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                        Colors.lightGreen
                    )),

                  ),
                ) ,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
