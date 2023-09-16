import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:lazure_cleaner/controller/profile_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../navigation/nav_paths.dart';

class EditProfileScreen extends GetView<ProfileController>{
  const EditProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    controller.setUser();

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey.shade700,
              size: 18,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          elevation: 0,
          title: Text(
            'Edit Profile',
          ),
        ),

        body: LoaderOverlay(
          overlayColor: Colors.black54.withOpacity(.4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 9,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 130,
                      right: 130,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //Get.toNamed(routeOTPVerification);
                      },
                      child: Stack(
                        children: [
                          CircularProfileAvatar('',
                              placeHolder: (context, path) => const Image(
                                image: AssetImage(
                                    'assets/images/user_avatar.png'),
                                width: 25,
                                height: 25,
                              ),
                              borderColor: Colors.white,
                              borderWidth: 2,
                              elevation: 0,
                              radius: 50,
                              errorWidget:(context, path,dynamic) => const Image(
                                image: AssetImage(
                                    'assets/images/user_avatar.png'),
                                width: 25,
                                height: 25,
                              ),
                              child:  Image.file(
                                File(controller.profileUrl.value),
                                fit: BoxFit.cover,
                                width: 95,
                                height: 95,
                              )

                            /*myImage != null ? Image.file(myImage!, fit: BoxFit.cover, width: 95, height: 95,) : const Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/user_avatar.png"),
                              width: 95,
                              height: 95,
                            ),*/

                          ),
                          Positioned(
                            right: 0,
                            left: 68,
                            bottom: 5,
                            child: InkWell(
                              onTap: () {
                                controller.getImage(ImgSource.Both, context);
                                debugPrint("Clicked");
                              },
                              child: const Image(
                                image: AssetImage('assets/icons/camera.png'),
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ),
                        ],
                      ),

                      /*const Image(
                        image: AssetImage('assets/images/profile_image.png'),
                        width: 90,
                        height: 90,
                      ),*/
                    ),
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 55, right: 36.29),
                          child: SizedBox(
                            height: 42,
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: TextFormField(
                                cursorColor: Colors.grey.shade500,
                                keyboardType: TextInputType.text,
                                controller: controller.fNController,
                                textCapitalization: TextCapitalization.sentences,
                                textAlignVertical: TextAlignVertical.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'User ID/Email is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'First Name',
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Colors.black12, width: 0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.black12, width: 1),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 0.5),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55, right: 36.29),
                          child: SizedBox(
                            height: 42,
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: TextFormField(
                                cursorColor: Colors.grey.shade500,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.sentences,
                                controller: controller.lNController,
                                textAlignVertical: TextAlignVertical.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'User ID/Email is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Last Name',
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Colors.black12, width: 0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.black12, width: 1),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 0.5),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55, right: 36.29),
                          child: SizedBox(
                            height: 42,
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: TextFormField(
                                readOnly: true,
                                cursorColor: Colors.grey.shade500,
                                keyboardType: TextInputType.text,
                                controller: controller.emailController,
                                textAlignVertical: TextAlignVertical.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'User ID/Email is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Colors.black12, width: 0.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.black12, width: 1),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 0.5),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55, right: 36.29),
                          child: Row(
                            children: [

                              Expanded(
                                flex: 3,
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(10),
                                  child: TextFormField(
                                    cursorColor: Colors.grey.shade400,
                                    keyboardType: TextInputType.text,
                                    controller: controller.mNumberController,
                                    textAlignVertical: TextAlignVertical.center,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: '',
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.black12, width: 0.5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black12, width: 1),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 0.5),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              /* const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Optional',
                            ),
                            ),
                          )*/
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55, right: 59),
                          child: ElevatedButton(

                            onPressed: () async {

                              if( await controller.updateProfile(context))
                              {
                                Get.offNamed(navHome);
                              }

                            },
                            child: Text(
                              'Done',
                            ),
                          ),
                        ),

                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*
  bool isPasswordShowing = false;
  bool isConfirmPassShowing = false;

  TextEditingController? fNController;
  TextEditingController? lNController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? cPasswordController;
  TextEditingController? mNumberController;
  TextEditingController? mCountyCodeController;


  File? myImage;

  String? profileUrl;

  CachedNetworkImage? cachedImage;
*/









