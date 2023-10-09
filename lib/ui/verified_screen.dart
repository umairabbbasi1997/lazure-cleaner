import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/controller/home_controller.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/verified.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(padding: EdgeInsets.only(top:10,bottom: 40),
                child:SizedBox(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                    await  HomeController.jobStartedRequest(context);

                      Get.back();
                    },
                    child:
                    Text("Done"
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                        Colors.green
                    )),

                  ),
                )
            ),
          )

        ],),
    );
  }
}


