import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';
import '../controller/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    var isYesChecked = false;
    var isNoChecked = false;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        fit: BoxFit.fill,
        image:
        AssetImage("assets/images/bg_lines_logo.jpeg",)
    )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 20),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                      height:80 ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _signupController.firstNameController,
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
                        labelText: "First Name",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _signupController.lastNameController,
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
                        labelText: "Last Name",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _signupController.mobileNoController,
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
                        labelText: "Mobile number",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _signupController.emailController,
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
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _signupController.passwordController,
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
                        labelText: "Create password",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _signupController.cnicController,
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
                        labelText: "CNIC",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    "Do you want request from female customer?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isYesChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isYesChecked = value!;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                        Text("Yes",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),),

                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Checkbox(
                            value: isNoChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isNoChecked = value!;
                              });
                            },

                          ),
                        ),
                        const Text("No",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),),
                      ],
                    )),
                Padding(padding: EdgeInsets.only(top: 10),
                  child:GestureDetector(
                    onTap: ()
                    {
                      Get.offAndToNamed(navHome);
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                        if(_signupController.signupRequest())
                          {
                            Get.offNamed(navHome);
                          }
                        },
                        child: Text("Sign Up"
                        ),
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                            Colors.lightGreen
                        )),

                      ),
                    ),
                  ) ,
                ),
                Padding(padding: EdgeInsets.only(top:10),
                    child:SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        child:
                        Text("Sign Up with Google"
                        ),
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                            Colors.red
                        )),

                      ),
                    )
                ),
                Padding(padding: EdgeInsets.only(top:10,bottom: 10),
                    child:SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        child:
                        Text("Sign Up with Facebook"
                        ),
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                            Colors.blue
                        )),

                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
