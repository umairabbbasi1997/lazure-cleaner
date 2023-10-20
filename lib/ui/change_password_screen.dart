import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/controller/change_password_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  ChangePasswordScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: LoaderOverlay(
        overlayColor: Colors.black54.withOpacity(.4),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 25),
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

               /* Center(
                  child: SizedBox(
                      height:80 ,
                      width: 150,
                      child: Image.asset("assets/icons/logo_black.png")),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(top: 110, left: 25, right: 25, bottom: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(
                          controller: controller.passwordController,
                          decoration: const InputDecoration(
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
                              labelText: "Current Password",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: TextField(
                          controller: controller.newPasswordController,
                          decoration: const InputDecoration(
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
                              labelText: "New Password",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: TextField(
                          controller: controller.confirmPasswordController,
                          decoration: const InputDecoration(
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
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),



                      Padding(padding: EdgeInsets.only(top: 60),
                        child:SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: ()  async {
                              /*if( await controller.loginRequest(context))
                              {
                                Get.offNamed(navHome);
                              }*/
                              controller.changePassword(context);
                            },
                            child:
                            Text("Update Password"
                            ),
                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                                Colors.lightGreen
                            )),

                          ),
                        ) ,
                      ),


                    ],

                  ),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
