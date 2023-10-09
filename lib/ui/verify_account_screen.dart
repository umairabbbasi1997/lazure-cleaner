import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lazure_cleaner/signup_controller_example.dart';
import 'package:lazure_cleaner/utils/form_validator.dart';
import 'package:lazure_cleaner/widgets/large_elevated_button_widget.dart';
import 'package:lazure_cleaner/widgets/my_text_field.dart';

import '../constants/image_path_constants.dart';

class VerifyAccountScreen extends StatefulWidget {
   VerifyAccountScreen({Key? key}) : super(key: key);

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {


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
            children: [


              Padding(padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Verify Account",
                  style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Please enter verification code sent to your phone",
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),
                  child:  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode){
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content: Text('Code entered is $verificationCode'),
                            );
                          }
                      );
                    }, // end onSubmit
                  ),),

              Padding(padding: EdgeInsets.only(top: 20),
                child:SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child:
                    Text("Verify"
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                        Colors.lightGreen
                    )),

                  ),
                ) ,
              ),
              Padding(padding: EdgeInsets.only(top: 30),
                child: Text(
                  "This code is valid for 5 minutes",
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Resend in 00:22",
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),
                child:SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child:
                    Text("Resend"
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
