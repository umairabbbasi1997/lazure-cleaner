import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/constants/BookingDetails.dart';
import 'package:lazure_cleaner/constants/BookingDetails.dart';
import 'package:lazure_cleaner/constants/BookingDetails.dart';
import 'package:lazure_cleaner/constants/BookingDetails.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';

import '../controller/home_controller.dart';
import '../utils/constants.dart';
import '../utils/local_storage_service.dart';

class FirebaseMessagingService
{
  final FirebaseMessaging _fcm;
  int id = 0;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  FirebaseMessagingService(this._fcm);

  Future initialise() async {
   /* if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }*/

    // If you want to test the push notification locally,
    // you need to get the token and input to the Firebase console
    // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
    String? token = await _fcm.getToken();
    print("FirebaseMessaging token: $token");
    await LocalStorageService().save(Constants.fcmToken, token);

    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream lestener]


    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      debugPrint('Notificatuion Recieved'+notification!.body.toString());

      debugPrint('notification_payload'+message.data.toString());
      // booking data
      String bookingData  = message.data['booking'].toString() ;//?? message;
      final bookingJsonDecode = jsonDecode(bookingData);
      BookingDetails.bookingId.value = bookingJsonDecode["id"].toString();

      //customer data
      String customerData  = message.data['customer'].toString() ;//?? message;
      final jsonData = jsonDecode(customerData);
      debugPrint('data'+customerData.toString());
      String firstName = jsonData["first_name"].toString();
      String lastName = jsonData['last_name'].toString();
      String phone = jsonData['phone'].toString();


      //address data
      String addressData  = message.data['address'].toString() ;//?? message;
      final addressJsonData = jsonDecode(addressData);
      debugPrint('data'+addressJsonData.toString());
      String address = addressJsonData["address"].toString();
      String city = addressJsonData['city'].toString();


      debugPrint('data :'+firstName.toString()+lastName+phone);
      BookingDetails.customerName.value = firstName +" "+lastName;
      BookingDetails.customerPhone.value = phone;
      BookingDetails.customerAddress.value = address;
      BookingDetails.isNewRide.value = true;
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification?.title,
          notification?.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              "1",
              "FIREBASE",

              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ));

     // Get.offNamed(navHome);





      FlutterRingtonePlayer.play(
        android: AndroidSounds.notification,
        ios: IosSounds.bell,
        looping: false, // Android only - API >= 28
        volume: 0.1, // Android only - API >= 28
        asAlarm: false, // Android only - all APIs
      );


/*      if (notification != null && android != null) {}*/


    });
  }

  Future<void> _handleMessage(RemoteMessage message) async {

    debugPrint(message.data.toString()+"msg recvd");

    if(await LocalStorageService().read(Constants.jwToken)!=null)
    {


      String bookingData  = message.data['booking'].toString() ;//?? message;
      final bookingJsonDecode = jsonDecode(bookingData);
      BookingDetails.bookingId.value = bookingJsonDecode["id"].toString();

      String customerData  = message.data['customer'].toString() ;//?? message;
      final jsonData = jsonDecode(customerData);
      debugPrint('data'+customerData.toString());
      String firstName = jsonData["first_name"].toString();
      String lastName = jsonData['last_name'].toString();
      String phone = jsonData['phone'].toString();


      //address data
      String addressData  = message.data['address'].toString() ;//?? message;
      final addressJsonData = jsonDecode(addressData);
      debugPrint('data'+addressJsonData.toString());
      String address = addressJsonData["address"].toString();
      String city = addressJsonData['city'].toString();

      debugPrint('data :'+firstName.toString()+lastName+phone);
      BookingDetails.customerName.value = firstName +" "+lastName;
      BookingDetails.customerPhone.value = phone;
      BookingDetails.customerAddress.value = address;
      BookingDetails.isNewRide.value = true;


    }

  }


}