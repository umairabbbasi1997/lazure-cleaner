import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazure_cleaner/constants/BookingDetails.dart';
import 'package:lazure_cleaner/controller/home_controller.dart';

import 'package:lazure_cleaner/navigation/nav_paths.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:map_launcher/map_launcher.dart';

class HomeScreen extends GetView<HomeController> {


  final GlobalKey<ScaffoldState> _key = GlobalKey();




  @override
  Widget build(BuildContext context) {

    controller.setProfile();


    return LoaderOverlay(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          child: SafeArea(
            child: SingleChildScrollView(
              child: ListTileTheme(
                textColor: Colors.black,
                iconColor: Colors.black,
                child: SizedBox(
                  height: Get.size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [

                        Container(
                          color: Colors.grey.shade300,
                          child: Row(

                            children: [

                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset("assets/icons/profile_icon.png",
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Obx(() =>   Text(controller.userName.value,
                                    style:
                                    const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    )
                                )),
                                  Row(
                                    children: [
                                      Image.asset("assets/icons/star.png",
                                        height: 15,
                                        width: 15,
                                      ),
                                      Image.asset("assets/icons/star.png",
                                        height: 15,
                                        width: 15,
                                      ),
                                      Image.asset("assets/icons/star.png",
                                        height: 15,
                                        width: 15,
                                      ),
                                      Image.asset("assets/icons/star.png",
                                        height: 15,
                                        width: 15,
                                      ),
                                      Image.asset("assets/icons/star.png",
                                        height: 15,
                                        width: 15,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
/*                        ListTile(
                            onTap: () {
                              Get.offNamed(navHome);
                            },
                            leading:
                            Image.asset("assets/icons/home_icon.png",
                              height: 30,
                              width: 30,
                            ),
                            title: Text(
                              "Home",
                              style:
                              TextStyle(fontWeight: FontWeight.bold)
                              ,
                            )
                        ),*/
                        ListTile(
                          onTap: () {
                            Get.toNamed(navEditProfile);

                          },
                          leading: Image.asset(  height: 30,
                              width: 30,
                              "assets/icons/profile_icon.png"),
                          title: const Text(
                            "My Profile",
                            style:
                            TextStyle(fontWeight: FontWeight.bold)
                            ,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed(navJobHistory);
                          },
                          leading: Image.asset(  height: 30,
                              width: 30,
                              "assets/icons/job_history_icon.png"),
                          title: const Text(
                            "Job History",
                            style:
                            TextStyle(fontWeight: FontWeight.bold)
                            ,
                          ),
                        ),
/*                        ListTile(
                          onTap: () {

                          },
                          leading: Image.asset(  height: 30,
                              width: 30,
                              "assets/icons/notification_icon.png"),
                          title: Text(
                            "Notifications",
                            style:
                            TextStyle(fontWeight: FontWeight.bold)
                            ,
                          ),
                        ),
                        ListTile(
                          onTap: () {


                            // Get.offNamed(routeCheckoutScreen);

                          },
                          leading: Image.asset(  height: 30,
                              width: 30,
                              "assets/icons/contact_support_icon.png"),
                          title: Text(
                            "Contact & Support",
                            style:
                            TextStyle(fontWeight: FontWeight.bold)
                            ,
                          ),
                        ),*/
                        ListTile(
                          onTap: () {
                            Get.toNamed(navChangePassword);
                          },
                          leading: Image.asset(  height: 30,
                              width: 30,
                              "assets/icons/change_password_icon.png"),
                          title: const Text(
                            "Change Password",
                            style:
                            TextStyle(fontWeight: FontWeight.bold)
                            ,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            controller.logout(context);

                          },
                          leading: Image.asset(  height: 30,
                              width: 30,
                              "assets/icons/logout_icon.png"),
                          title: const Text(
                            "Logout",
                            style:
                            TextStyle(fontWeight: FontWeight.bold)
                            ,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black
          ,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 30,
                  height: 30,
                  child: GestureDetector(
                      onTap: (){
                        _key.currentState!.openDrawer();
                      },
                      child: Image.asset("assets/icons/menu.png"))),
              const Text("Online"),
             Obx(() =>  Switch(
               value: BookingDetails.isOnline.value,
               onChanged: (bool value) async {
                 await controller.switchOnlineRequest(context, value ? "1" : "0");

               },
               activeTrackColor: Colors.lightGreen,
               activeColor: Colors.white,
             ))
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        bottomSheet: Obx(() {

          if (BookingDetails.isNewRide.value) {
            controller.markLocation();
           return BottomSheet(
              onClosing: () {},
              builder: (BuildContext context) {
                return Wrap(
                    children: <Widget>[
                      Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                color: Colors.black,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50, right: 50),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Obx(() => Text(
                                            BookingDetails.customerName.value,
                                            style: const TextStyle(color: Colors.white),
                                          )),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset("assets/icons/star.png"),
                                                ),
                                              ),
                                              const Text("4.6",
                                                  style: TextStyle(color: Colors.white)),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [


                                          SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: IconButton(
                                                onPressed: () async {
                                                  controller.navigateToDestination(
                                                      Coords(double.parse(BookingDetails.customerLat.value) ,
                                                          double.parse(BookingDetails.customerLng.value)));
                                                },
                                                icon: Image.asset("assets/icons/navigator_icon.png"),
                                              )),
                                          SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Image.asset("assets/icons/message_icon.png"),
                                              )),
                                          SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: IconButton(
                                                onPressed: () {

                                                  controller.makePhoneCall(BookingDetails.customerPhone.value);
                                                },
                                                icon: Image.asset("assets/icons/call_icon.png"),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50,right: 50),
                              child: Column(

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Contact Number",
                                                  style: TextStyle(fontWeight: FontWeight.w600),
                                                ),
                                                Obx(() =>  Text(BookingDetails.customerPhone.value)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Address",
                                                  style: TextStyle(fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  width: 100,
                                                  child: Obx(() => Text(
                                                    BookingDetails.customerAddress.value,
                                                    softWrap: true,
                                                    textAlign: TextAlign.justify,
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          /* Padding(
                                            padding: const EdgeInsets.only(top: 8,bottom: 8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Car registeration",
                                                  style: TextStyle(fontWeight: FontWeight.w600),
                                                ),
                                                Text("abc 123456"),
                                              ],
                                            ),
                                          )*/
                                        ],
                                      ),
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: CircleAvatar(

                                          child: Image.asset("assets/icons/user.png"),
                                        ),
                                      )

                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 20),
                                      child: Obx(() => Row(
                                        mainAxisAlignment: controller.buttonsAlignment.value,
                                        children: [

                                          Visibility(
                                            visible: BookingDetails.isArrived.value,
                                            child: SizedBox(
                                              height: 50,
                                              width: 140,
                                              child: ElevatedButton(

                                                onPressed: () {


                                                  /* else
                                              {
                                                arrivedText = "End Cleaning";

                                              }*/

                                                  if(controller.arrivedText.value == "Arrived")
                                                  {
                                                    controller.jobArrivedRequest(context);



                                                  }
                                                  else if(controller.arrivedText.value == "End Cleaning")
                                                  {
                                                    BookingDetails.carPictureType = BookingDetails.afterCleaning;
                                                    Get.toNamed(navVehicleCleaningProof);
                                                    controller.jobCompletedRequest(context);
                                                  }

                                                },
                                                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                                                    Colors.lightGreen
                                                )),
                                                child:
                                                Text(controller.arrivedText.value
                                                ),

                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: BookingDetails.isReject.value,
                                            child: Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: SizedBox(
                                                  height: 50,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      controller.jobRejectRequest(context);
                                                    },
                                                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                                                        Colors.red
                                                    )),
                                                    child:
                                                    const Text("Ignore"
                                                    ),

                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: BookingDetails.isAccept.value,
                                            child: Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: SizedBox(
                                                  height: 50,
                                                  child: ElevatedButton(
                                                    onPressed: () {

//                                                HomeController.isNewRide.value = false;

                                                      controller.jobAcceptRequest(context);

                                                      controller.buttonsAlignment.value = MainAxisAlignment.center;


                                                    },
                                                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                                                        Colors.lightGreen
                                                    )),
                                                    child:
                                                    const Text("Accept"
                                                    ),

                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),)
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ]

                );
              },
            );
          }
          else {
            return const SizedBox();
          }
        } ),
        body: LoaderOverlay(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Obx(() => GoogleMap(
              onMapCreated: controller.onMapCreated,
              initialCameraPosition:
              const CameraPosition(
                target: LatLng(0,0),

                zoom: 16.0,
              ),
              markers: Set.of(controller.markers.values),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ))
            ,
          ),
        ),

        /*  Image.asset(
          "assets/images/map.png",
          fit: BoxFit.fill,
        )*/
      ),
    );
  }

}

