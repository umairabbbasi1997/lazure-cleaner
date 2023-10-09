import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lazure_cleaner/controller/home_controller.dart';
import 'package:lazure_cleaner/navigation/screen_nav.dart';
import 'package:lazure_cleaner/services/firebase_messaging_service.dart';
import 'package:lazure_cleaner/ui/change_password_screen.dart';
import 'package:lazure_cleaner/ui/home_screen.dart';

import 'package:lazure_cleaner/ui/splash_screen.dart';
import 'package:lazure_cleaner/utils/constants.dart';
import 'package:lazure_cleaner/utils/local_storage_service.dart';
import 'package:permission_handler/permission_handler.dart';

import 'constants/BookingDetails.dart';
import 'controller/change_password_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await requestNotificationPermissions();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  FirebaseDatabase.instance.reference().keepSynced(true);
  runApp(const MyApp());
}
Future<void> requestNotificationPermissions() async {
  final PermissionStatus status = await Permission.notification.request();
  if (status.isGranted) {
    // Notification permissions granted
  } else if (status.isDenied) {
    // Notification permissions denied
  } else if (status.isPermanentlyDenied) {
    // Notification permissions permanently denied, open app settings
    await openAppSettings();
  }
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
  debugPrint("background message :"+message.data.toString());



}
