import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lazure_cleaner/navigation/screen_nav.dart';
import 'package:lazure_cleaner/ui/collect_payment.dart';
import 'package:lazure_cleaner/ui/home_screen.dart';
import 'package:lazure_cleaner/ui/job_complete_screen.dart';
import 'package:lazure_cleaner/ui/login_screen.dart';
import 'package:lazure_cleaner/ui/signup_screen.dart';
import 'package:lazure_cleaner/ui/splash_screen.dart';
import 'package:lazure_cleaner/ui/upload_car_details.dart';
import 'package:lazure_cleaner/ui/verified_screen.dart';
import 'package:lazure_cleaner/ui/verify_account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

@override
  Widget build(BuildContext context) {

  return GetMaterialApp(
    getPages: NavPaths.screens,
    title: 'Lazure',
    home: HomeScreen(),
  );
  }


}





