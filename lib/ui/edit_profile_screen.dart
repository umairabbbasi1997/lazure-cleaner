import 'dart:ffi';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
          child: Container(
            height: MediaQuery.of(context).size.height,

            decoration:  const BoxDecoration(

                image: DecorationImage(
                  fit: BoxFit.fill,
                  image:
                  AssetImage("assets/images/lines.png",),

                )
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                /*  Center(
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
*//*                            CircularProfileAvatar('',
                                placeHolder: (context, path) => const Image(
                                  image: AssetImage(
                                      'assets/icons/user.png'),
                                  width: 25,
                                  height: 25,
                                ),
                                borderColor: Colors.white,
                                borderWidth: 2,
                                elevation: 0,
                                radius: 50,
                                errorWidget:(context, path,dynamic) => const Image(
                                  image: AssetImage(
                                      'assets/icons/user.png'),
                                  width: 25,
                                  height: 25,

                                ),

                              child: Obx(() =>
                              controller.myImage.value != null
                              ? Image.file(
                                controller.myImage.value!,
                                fit: BoxFit.cover,
                                width: 95,
                                height: 95,
                              )
                                :controller.cachedImage.value == null ? const Image(
                        image: AssetImage('assets/icons/user_avatar.png'),
                        width: 25,
                        height: 25,
                      ) : controller.cachedImage.value

                            )),*//*
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

                        *//*const Image(
                          image: AssetImage('assets/images/profile_image.png'),
                          width: 90,
                          height: 90,
                        ),*//*
                      ),
                    ),
                  ),*/
                  const SizedBox(
                    height: 38,
                  ),
                  Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 55, right: 36.29),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 8.0),
                                  child: Text("Name: ",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 42,
                                  child: Material(
//                                elevation: 5,
//                                borderRadius: BorderRadius.circular(10),
                                    child: TextFormField(
                                      cursorColor: Colors.grey.shade500,
                                      keyboardType: TextInputType.text,
                                      controller: controller.nameController,
                                      textCapitalization: TextCapitalization.sentences,
                                      textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true
                                        )
/*                                  decoration: InputDecoration(
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
                                      ),*/
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55, right: 36.29),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 8.0),
                                  child: Text("Mobile No: ",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 42,
                                  child: Material(
                                    //elevation: 5,
                                    //borderRadius: BorderRadius.circular(10),
                                    child: TextFormField(
                                      cursorColor: Colors.grey.shade500,
                                      keyboardType: TextInputType.text,
                                      textCapitalization: TextCapitalization.sentences,
                                      controller: controller.mNumberController,
                                      textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true
                                        )
                                     /* validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'User ID/Email is required';
                                        }
                                        return null;
                                      },*/
/*                                  decoration: InputDecoration(
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
                                      ),*/
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55, right: 36.29),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 8.0),
                                  child: Text("Email: ",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 42,
                                  child: Material(
                                    //elevation: 5,
                                   // borderRadius: BorderRadius.circular(10),
                                    child: TextFormField(
                                      readOnly: true,
                                      cursorColor: Colors.grey.shade500,
                                      keyboardType: TextInputType.text,
                                      controller: controller.emailController,
                                      textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true
                                        )

/*                                  decoration: InputDecoration(
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
                                      ),*/
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55, right: 36.29),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 8.0),
                                  child: Text("Gender: ",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Material(
                                 //   elevation: 5,
                                //    borderRadius: BorderRadius.circular(10),
                                  child: TextFormField(
                                    readOnly: true,
                                    cursorColor: Colors.grey.shade400,
                                    keyboardType: TextInputType.text,
                                    controller: controller.genderController,
                                    textAlignVertical: TextAlignVertical.center, decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true
                                  ),
/*                                      validator: (value) {
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
                                    ),*/
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 23,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: SizedBox(
                              width: 140,
                              height: 50,
                              child: ElevatedButton(

                                onPressed: () async {

                                  if( await controller.updateProfile(context))
                                  {
                                    Get.offNamed(navHome);
                                  }

                                },
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                                    Colors.lightGreen
                                )),
                                child: Text(
                                  'Done',
                                ),
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









