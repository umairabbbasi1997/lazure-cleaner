import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker_plus/image_picker_plus.dart';

import 'package:lazure_cleaner/controller/verify_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../constants/BookingDetails.dart';

class UploadCarDetails extends GetView<VerifyController> {
  File? myImage;
  final ImagePickerPlus _picker = ImagePickerPlus(Get!.context!);


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: LoaderOverlay(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/lines.png",
                    ),
                  )),
            ),
            Column(
              children: [
                const Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 100,left: 10,right: 10),
                      child: Text(
                        "Take a picture of car's number plate",
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                          fontSize: 18
                        ),
                      ),
                    ),




                  ],
                ),

                Center(child: Obx(() => imageView(context))),

                const Spacer(),
                Padding(padding: const EdgeInsets.only(top: 30,bottom: 10,left: 30,right: 30),
                  child:GestureDetector(
                    onTap: (){
                      getImage(ImageSource.camera,context);
                    },
                    child: Container(

                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset(
                                  "assets/icons/camera.png"),
                            ),
                          ),
                          const Text("Number Plate",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                        ],

                      ),
                    ),
                  ) ,
                ),
                Padding(padding: const EdgeInsets.only(top:10,bottom: 30,left: 30,right: 30),
                    child:SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {

//                    controller.verifyCarDetails();
                          if(myImage!.path.isNotEmpty)
                          {
                            controller.verifyPlat(myImage!.path,context);

                          }
                          else
                          {
                            Get.snackbar("Error", "Take a picture of car's number plate ${BookingDetails.carPictureType} cleaning",
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,
                                backgroundColor: Colors.red);
                          }
                        },
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                            Colors.lightGreen
                        )),
                        child:
                        const Text("Verify"
                        ),

                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future getImage(ImageSource source,BuildContext context) async {
    var image = await _picker.pickImage(source: source);/* .pickImage(
      enableCloseButton: true,
      closeIcon: const Icon(
        Icons.close,
        color: Colors.red,
        size: 12,
      ),
      context: context,
      source: source,
      barrierDismissible: true,
      cameraIcon: const Icon(
        Icons.camera_alt,
        color: Colors.red,
      ),
      //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
      cameraText: const Text(
        "From Camera",
        style: TextStyle(color: Colors.red),
      ),
      galleryText: const Text(
        "From Gallery",
        style: TextStyle(color: Colors.blue),
      ),
    );
*/
    myImage = File(image!.selectedFiles.first.selectedFile.path);

    controller.selectedImagePath.value = image.selectedFiles.first.selectedFile.path;

   // controller.recognizedText(image.selectedFiles.first.selectedFile.path);

 }

  Widget imageView(BuildContext ctx) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                    width: 350,
                    height: 350
                    ,child: controller.selectedImagePath.value.toString() == '' ? SizedBox() : Image.file(File(controller.selectedImagePath.value)))),
          ),
        ]));
  }
}


