import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazure_cleaner/model/UserResponse.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';
import 'package:lazure_cleaner/utils/constants.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';

import '../api_service/api_services.dart';

import '../utils/local_storage_service.dart';

class HomeController extends GetxController {
  late GoogleMapController mapController;

  var userName = "".obs;

  var isAccept = true.obs;
  var isReject = true.obs;
  var isArrived = false.obs;
  var isCompleted = false.obs;
  var isOnline = true.obs;
  static var isNewRide = false.obs;
  static var customerName = "".obs;
  static var customerPhone = "".obs;
  static var bookingId = "".obs;

  var buttonsAlignment = MainAxisAlignment.spaceBetween.obs;
  var arrivedText = "Arrived".obs;

  var currentLocation = LatLng(0, 0).obs;


  Position? posinitial;
  final lat = 0.0.obs, lng = 0.0.obs;


  @override
  void onInit() async {
    /// Run through here

    super.onInit();
  }
  getPositionData() async{
    // try to log the data if its not empty
    if (posinitial != null) {
      debugPrint("${posinitial!.latitude} name:latitude");
      debugPrint("${posinitial!.longitude } name:longtitude");
      /// just pass this to ui to use
      currentLocation.value = LatLng(posinitial!.latitude, posinitial!.longitude);
      lat(posinitial!.latitude);
      lng(posinitial!.longitude);
     mapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition( target: currentLocation.value,
            zoom: 16.0,)));
      Get.context?.loaderOverlay.hide();
    }
  }

  Future<void> logout(BuildContext context) async {
/*
    var response = await ApiService().get(Constants.LOGOUT_URL, context);

    var success = jsonDecode(response.body)['success'];
*/

    await LocalStorageService().clear();

    Get.offNamed(navLogin);
  }



  Future<void> jobAcceptRequest(BuildContext context) async {
    Map<String, String> param = {"booking_id": bookingId.value.toString()};

    var response =
        await ApiService().post(Constants.ACCEPT_JOB_URL, context, body: param);

    var success = jsonDecode(response.body)['success'];

    if (success) {
      debugPrint("job accepted success");

      FlutterRingtonePlayer.stop();
      arrivedText.value = "Arrived";
      isReject.value = !isReject.value;
      isAccept.value = !isAccept.value;
      isArrived.value = !isArrived.value;
    }
  }

  Future<void> jobRejectRequest(BuildContext context) async {
    Map<String, String> param = {"booking_id": bookingId.value.toString()};

    var response =
        await ApiService().post(Constants.REJECT_JOB_URL, context, body: param);

    var success = jsonDecode(response.body)['success'];

    if (success) {
      debugPrint("job rejected success");
      isNewRide.value = false;
      isReject.value = true;
    }
  }

  Future<void> jobArrivedRequest(BuildContext context) async {
    Map<String, String> param = {"booking_id": bookingId.value.toString()};

    var response = await ApiService()
        .post(Constants.ARRIVED_JOB_URL, context, body: param);

    var success = jsonDecode(response.body)['success'];

    if (success) {
      debugPrint("job arrived success");
/*      isReject.value = !isReject.value;
      isAccept.value = !isAccept.value;
      isArrived.value = !isArrived.value;
      buttonsAlignment.value = MainAxisAlignment.spaceBetween;*/
      arrivedText.value = "End Cleaning";
      Get.toNamed(navUploadCarDetails);
    }
  }

  Future<void> jobCompletedRequest(BuildContext context) async {
    Map<String, String> param = {"booking_id": bookingId.value.toString()};

    var response = await ApiService()
        .post(Constants.ARRIVED_JOB_URL, context, body: param);

    var success = jsonDecode(response.body)['success'];

    if (success) {
      debugPrint("job completed success");
      HomeController.isNewRide.value = false;
      isReject.value = isReject.value;
      isAccept.value = isAccept.value;
      isArrived.value = isArrived.value;
      buttonsAlignment.value = MainAxisAlignment.spaceBetween;
      Get.toNamed(navJobComplete);
    }
  }

  setProfile() async {
    var user = await getUser();
    var fullName = user!.firstName.toString() + " " + user.lastName.toString();
    userName = fullName.obs;
  }

  Future<UserResponse?> getUser() async {
    var userObj = await LocalStorageService().read(Constants.currentUser);
    if (userObj == null) {
      return null;
    } else {
      Map<String, dynamic> userMap = jsonDecode(userObj);
      debugPrint("user: $userMap");
      UserResponse user = UserResponse.fromJson(userMap);
      return user;
    }
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
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

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var postion = await Geolocator.getCurrentPosition();
    currentLocation.value = LatLng(postion.latitude, postion.longitude);
    debugPrint("location: " +
        currentLocation.value.longitude.toString() +
        " " +
        currentLocation.value.longitude.toString());
    return await Geolocator.getCurrentPosition();
  }

  Future permissionForLocation() async {
    final request = await [Permission.location].request();
    debugPrint(request[Permission.location].toString());
    final status = await Permission.location.status;

    if (status.isDenied) {
      request;
      return false;
    } else if (status.isRestricted) {
      request;
      return false;
    } else if (status.isLimited) {
      request;
      return false;
    } else {
      return true;
    }
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    await permissionForLocation().then((value) async {
      Get.context?.loaderOverlay.show();
      posinitial = await determinePosition();
    }).whenComplete(() {
      getPositionData();
    });

   // update();

  }

}
