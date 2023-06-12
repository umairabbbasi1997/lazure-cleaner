import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>   Get.toNamed(navLogin)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset("assets/images/splash_screen.jpg",
        fit: BoxFit.fill,
        ),
      ),
    );
  }
}
