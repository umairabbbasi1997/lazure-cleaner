import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:lazure_cleaner/controller/vehicle_cleaning_proof_controller.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../constants/BookingDetails.dart';

class VehicleCleaningProof extends GetView<VehicleCleaningProofController> {
  File? myImage;

  @override
  Widget build(BuildContext context) {
  //  Get.put(VehicleCleaningProofController());
    controller.picker = ImagePickerPlus(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: LoaderOverlay(
            overlayColor: Colors.black54.withOpacity(.4),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/images/lines.png",
                ),
              )),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 100,left: 10,right: 10),
                    child: Text(
                      "Take a picture of car ${BookingDetails.carPictureType} cleaning side by side",
                      softWrap: true,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18
                      ),
                    ),
                  ),
                  Expanded(
                      child: Obx(() => GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext ctx, int index) {
                              return imageView(ctx, index);
                            },
                            itemCount: controller.imageList.length,
                          ))),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              controller.getImage(ImageSource.camera, context);
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.lightGreen),
                            ),
                            child: const Text("Take Photos"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 10),
                    child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {
                              if(controller.imageList.isNotEmpty)
                              {
                              await controller.uploadCarImages(context,BookingDetails.carPictureType);
                              if(BookingDetails.carPictureType == BookingDetails.beforeCleaning)
                                {
                                  Get.offNamed(navUploadCarDetails);
                                }
                              else{
                                Get.offNamed(navHome);
                              }

                              }
                              else
                              {
                              Get.snackbar("Error", "Please take vehicle pictures ${BookingDetails.carPictureType} cleaning",
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: Colors.red);
                              }

                            },
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.lightGreen),
                            ),
                            child: const Text("Next"))),
                  ),
                ],
              ),
            )));
  }

  Widget imageView(BuildContext ctx, int index) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                width: 200,
                height: 200
                ,child: Image.file(File(controller.imageList[index])))),
          ),
          Positioned(
            width: 20,
            height: 20,
            bottom: 165,
            left: 165,
            child: GestureDetector(
                onTap: () {
                  controller.imageList.removeAt(index);
                },
                child: SizedBox(child: Image.asset("assets/icons/delete_button_icon.png"))),
          ),
        ]));
  }


}
