import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazure_cleaner/constants/BookingDetails.dart';
import 'package:lazure_cleaner/model/UserResponse.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';
import 'package:lazure_cleaner/utils/constants.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api_service/api_services.dart';

import '../utils/local_storage_service.dart';

class HomeController extends GetxController {

  late GoogleMapController mapController;



  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;
  var firebaseRef = FirebaseDatabase.instance.ref();

  var buttonsAlignment = MainAxisAlignment.spaceBetween.obs;
  var arrivedText = "Arrived".obs;

  var currentLocation = LatLng(0, 0).obs;


  Position? posinitial;
  final lat = 0.0.obs, lng = 0.0.obs;

  UserResponse? user;

  StreamSubscription<Position>? positionStream;

  var userName;


  @override
  void onInit() async {
    /// Run through here

    BookingDetails.isOnline.value = await LocalStorageService().read(Constants.IS_ONLINE) ?? false;
    print("online: "+BookingDetails.isOnline.value.toString() );
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
  
  updateLiveLocation() async {

    if(user==null)
      {
        setProfile();
      }
    
    positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high,distanceFilter: 1),
    ).listen((position) {
      // Do something with the new position
      
      firebaseRef
          .child("riders")
          .child("rider"+user!.id.toString())
          .child("latitude")
          .set(position.latitude);

      firebaseRef
          .child("riders")
          .child("rider"+user!.id.toString())
          .child("longitude")
          .set(position.longitude);


    });
  }

  Future<void> logout(BuildContext context) async {
/*
    var response = await ApiService().get(Constants.LOGOUT_URL, context);

    var success = jsonDecode(response.body)['success'];
*/

    await LocalStorageService().clear();

    Get.offNamed(navSplash);
  }



  Future<void> jobAcceptRequest(BuildContext context) async {
    Map<String, String> param = {"booking_id": BookingDetails.bookingId.value.toString()};

    var response =
        await ApiService().post(Constants.ACCEPT_JOB_URL, context, body: param);

    var success = jsonDecode(response.body)['success'];

    if (success) {

      firebaseRef
          .child("riders")
          .child("rider"+user!.id.toString())
          .child("jobStatus")
          .set("In-Route");

      debugPrint("job accepted success");

      FlutterRingtonePlayer.stop();
      arrivedText.value = "Arrived";

      BookingDetails.isReject.value = !BookingDetails.isReject.value;
      BookingDetails.isAccept.value = !BookingDetails.isAccept.value;
      BookingDetails.isArrived.value = !BookingDetails.isArrived.value;

      updateLiveLocation();
    }
  }

  Future<void> jobRejectRequest(BuildContext context) async {
    Map<String, String> param = {"booking_id": BookingDetails.bookingId.value.toString()};

    removeMarker();
    var response =
        await ApiService().post(Constants.REJECT_JOB_URL, context, body: param);

    var success = jsonDecode(response.body)['success'];

    if (success) {

      firebaseRef
          .child("riders")
          .child("rider"+user!.id.toString())
          .child("jobStatus")
          .set("rejected");

      debugPrint("job rejected success");
      BookingDetails.isNewRide.value = false;
      BookingDetails.isReject.value = true;
    }
  }

  Future<void> jobArrivedRequest(BuildContext context) async {
    Map<String, String> param = {"booking_id": BookingDetails.bookingId.value.toString()};

    var response = await ApiService()
        .post(Constants.ARRIVED_JOB_URL, context, body: param);

    var success = jsonDecode(response.body)['success'];

    if (success) {
      firebaseRef
          .child("riders")
          .child("rider"+user!.id.toString())
          .child("jobStatus")
          .set("Arrived");

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
    Map<String, String> param = {"booking_id": BookingDetails.bookingId.value.toString()};

    var response = await ApiService()
        .post(Constants.COMPLETED_JOB_URL, context, body: param);

    var success = jsonDecode(response.body)['success'];

    if (success) {
      firebaseRef
          .child("riders")
          .child("rider"+user!.id.toString())
          .child("jobStatus")
          .set("Completed");

      removeListener(() {positionStream; });
      positionStream?.cancel();

      firebaseRef
          .child("riders")
          .child("rider${user!.id}")
          .child("latitude")
          .remove();

      firebaseRef
          .child("riders")
          .child("rider${user!.id}")
          .child("longitude")
          .remove();


      debugPrint("job completed success");
      BookingDetails.isNewRide.value = false;
      BookingDetails.isReject.value = true;
      BookingDetails.isAccept.value = true;
      BookingDetails.isArrived.value = false;
      buttonsAlignment.value = MainAxisAlignment.spaceBetween;
      Get.toNamed(navJobComplete);
    }
  }

  static Future<void> jobStartedRequest(BuildContext context) async
  {
    var user;

    var userObj = await LocalStorageService().read(Constants.currentUser);
    if (userObj == null) {
      return null;
    } else {
      Map<String, dynamic> userMap = jsonDecode(userObj);

      UserResponse userR = UserResponse.fromJson(userMap);
      user = userR;
    }

    FirebaseDatabase.instance.ref()
        .child("riders")
        .child("rider"+user!.id.toString())
        .child("jobStatus")
        .set("Started");
  }

  Future<void> switchOnlineRequest(BuildContext context,String status) async {
    Map<String, String> param = {"status": status};

    var response = await ApiService()
        .post(Constants.SWITCH_ONLINE_STATUS_URL, context, body: param);

    var success = jsonDecode(response.body)['success'];

    if (success) {


      BookingDetails.isOnline.value = !BookingDetails.isOnline.value;

      await LocalStorageService().save(Constants.IS_ONLINE, BookingDetails.isOnline.value);

      print("statusSwitched: "+BookingDetails.isOnline.value.toString()+" statuskey: "+status);
    }
  }


  setProfile() async {
     user = await getUser();
    var fullName = user!.firstName.toString() + " " + user!.lastName.toString();
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


  Future<void> navigateToDestination(Coords coords)
  async {

    final availableMaps = await MapLauncher.installedMaps;
    print(availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    await availableMaps.first.showMarker(
      coords: coords,
      title: "Destination",
    );
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
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

 bool markLocation() {

if(BookingDetails.customerLng.value != null || BookingDetails.customerLat.value !=null || BookingDetails.customerLng.value != "" || BookingDetails.customerLat.value != "")
  {
    try{
      var marker = Marker(
          markerId: MarkerId('customer'),
          position: LatLng(double.parse(BookingDetails.customerLat.value), double.parse(BookingDetails.customerLng.value))

        // icon: BitmapDescriptor.,
      );
      markers[MarkerId('customer')] = marker;
    }
    catch(e){
      print(e.toString());
    }
    print("lng: "+BookingDetails.customerLng.value +"lat: "+BookingDetails.customerLat.value);



    return true;
  }
else
{
  return true;
}




  }

  removeMarker(){
    markers.clear();
  }

}
