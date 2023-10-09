import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';

class UploadCarDetails extends StatefulWidget {
  const UploadCarDetails({Key? key}) : super(key: key);

  @override
  State<UploadCarDetails> createState() => _UploadCarDetailsState();
}

class _UploadCarDetailsState extends State<UploadCarDetails> {

  File? myImage;
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 280,
            color: Colors.black87,

            margin:
            const EdgeInsets.only(top: 180, left: 45, right: 45, bottom: 20),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 40,left: 10,right: 10),
                  child: Text(
                    "Take a picture of car's number plate and other side in order",

                    softWrap: true,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 30),
                  child:GestureDetector(
                    onTap: (){
                      getImage(ImgSource.Camera);
                    },
                    child: Container(

                      height: 50,
                      width: 160,
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
                          Text("Number Plate",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        ],

                      ),
                    ),
                  ) ,
                ),
                Padding(padding: EdgeInsets.only(top: 20),
                  child:GestureDetector(
                    onTap: (){
                      getImage(ImgSource.Camera);
                    },
                    child: Container(

                      height: 50,
                      width: 160,
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
                          Text("Sides",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                        ],

                      ),
                    ),
                  ) ,
                ),

              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top:10),
              child:SizedBox(
                width: 160,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed(navVerified);
                  },
                  child:
                  Text("Verify"
                  ),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                      Colors.lightGreen
                  )),

                ),
              )
          )
        ],
      ),
    );
  }

  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
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

    myImage = File(image.path);

    setState(() {
      myImage = File(image.path);
    });
  }
}
