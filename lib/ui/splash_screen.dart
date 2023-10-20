import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';
import 'package:lazure_cleaner/utils/constants.dart';
import 'package:lazure_cleaner/utils/local_storage_service.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {

    super.initState();

    // delay and check session
    Timer(Duration(seconds: 2),
            () async =>  await checkSession() == true ?   Get.offNamed(navHome) : Get.offNamed(navLogin)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/splash_bg.png",
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/app_main_logo.png", scale: 4, ),
            // SizedBox(height: 5,),
/*            Image.asset(IconPathConstants.carIcon, scale: 2.5, ),*/
            const SizedBox(height: 50),
            const CupertinoActivityIndicator(
              radius: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> checkSession() async {

   if(await LocalStorageService().read(Constants.jwToken) !=null )
   {
     return true;
   }
   else {return false;}

  }

  Future<void> checkLocationPermission() async
  {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


  }

}
