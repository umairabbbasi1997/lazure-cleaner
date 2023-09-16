import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lazure_cleaner/navigation/screen_nav.dart';
import 'package:lazure_cleaner/services/firebase_messaging_service.dart';
import 'package:lazure_cleaner/ui/change_password_screen.dart';

import 'package:lazure_cleaner/ui/splash_screen.dart';

import 'controller/change_password_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // This widget is the root of your application.

@override
  Widget build(BuildContext context) {


  final FirebaseMessagingService _firebaseMessagingService = FirebaseMessagingService(_firebaseMessaging);
  _firebaseMessagingService.initialise();

  return GetMaterialApp(
  getPages: NavPaths.screens,
    title: 'Lazure',
    home: SplashScreen(),
  );
  }


}






Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message");

}
