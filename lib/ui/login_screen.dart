import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lazure_cleaner/controller/login_controller.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';
import 'package:lazure_cleaner/signup_controller_example.dart';
import 'package:lazure_cleaner/utils/form_validator.dart';
import 'package:lazure_cleaner/widgets/large_elevated_button_widget.dart';
import 'package:lazure_cleaner/widgets/my_text_field.dart';

import '../constants/image_path_constants.dart';

class LoginScreen extends GetView<LoginController> {
   LoginScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    Get.put(LoginController());

    //controller.emailController.text="abc@abc.com";
    //controller.passwordController.text="abc@abc.com";



    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 25),
          decoration:  const BoxDecoration(

              image: DecorationImage(
                fit: BoxFit.fill,
                  image:
                  AssetImage("assets/images/lines.png",),

              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Center(
                child: SizedBox(
                  height:80 ,
                    width: 150,
                    child: Image.asset("assets/icons/logo_black.png")),
              ),
              Padding(
                padding: EdgeInsets.only(top: 180, left: 25, right: 25, bottom: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: controller.emailController,
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
                        controller: controller.passwordController,
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
                          onPressed: ()  {
                            if( controller.loginRequest())
                            {
                              Get.offNamed(navHome);
                            }
                          },
                          child:
                          Text("Login"
                          ),
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                              Colors.lightGreen
                          )),

                        ),
                      ) ,
                    ),

                    GestureDetector(
                      onTap: ()
                      {
                        Get.toNamed(navSignup);
                      },
                      child: Padding(padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                            "Don't have a account? Signup",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],

                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
