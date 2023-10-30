import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lazure_cleaner/model/UserResponse.dart';
import 'package:lazure_cleaner/utils/constants.dart';
import 'package:permission_handler/permission_handler.dart';

import '../api_service/api_services.dart';
import '../utils/local_storage_service.dart';

class ProfileController extends GetxController {



  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController mNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();



  var myImage = null.obs ;

  var profileUrl = ''.obs;

  var cachedImage = CachedNetworkImage(imageUrl: "").obs;

  late UserResponse user;

/*  Future getImage(ImgSource source,BuildContext context) async {

    await Permission.photos.request();

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

//    myImage.value = File(image.path) ;
    profileUrl.value = image.path;

    *//*setState(() {
        myImage = File(image.path);
      });*//*
  }*/


  Future<bool> updateProfile( BuildContext context) async {


    debugPrint("cntrl: "+nameController.text.toString());
    if (nameController.text.toString().isEmpty  ) {
      Get.snackbar("Error", "First Name is required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);

      return false;
    }



    if(genderController.text.toString().isEmpty)
    {
      Get.snackbar("Error", "Password must be 6 characters long",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      return false;
    }

    if(mNumberController.text.toString().length < 11)
    {
      Get.snackbar("Error", "Phone must be 11 characters long",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      return false;
    }
      else
      {
           Map<String,String> param =
           {"first_name":nameController.text.toString(),
             "last_name":genderController.text.toString(),
             "phone":mNumberController.text.toString()
           };
        var response = await ApiService().post(Constants.profileUpdateURL,context,body: param);

        var  succes = jsonDecode(response.body)['success'];


           if(succes)
           {

             var jsonResult = jsonDecode(response.body)['data'];


             var user = UserResponse.fromJson(jsonResult);
             String userString = jsonEncode(user);

             await LocalStorageService().save(Constants.currentUser,userString);

           }
           else{

             var  message = jsonDecode(response.body)['message'];

             Get.snackbar("Error", message,
                 snackPosition: SnackPosition.BOTTOM,
                 colorText: Colors.white,
                 backgroundColor: Colors.red);
           }

        return succes;
      }
  }

/*  Future<bool> getProfile( BuildContext context) async {


    debugPrint("cntrl: "+fNController!.text.toString());

      Map<String,String> param =
      {"first_name":fNController!.text.toString(),
        "last_name":lNController!.text.toString(),
        "phone":mNumberController!.text.toString()
      };
      var response = await ApiService().post(Constants.profileUpdateURL,context,body: param);

      var  succes = jsonDecode(response.body)['sucess'];

      var  token = jsonDecode(response.body)['token'];


      await LocalStorageService().save(Constants.jwToken,token);

      debugPrint("succes: "+succes.toString()+"token: "+token);

      return succes;

  }*/



  setUser() async {
    var user = await getUser();
     nameController.text = user!.firstName.toString()+" "+user!.lastName.toString();
     genderController.text = user!.gender.toString();
     mNumberController.text = user!.phone.toString();
     emailController.text = user!.email.toString();


    profileUrl.value = "";

    if (myImage.value == null) {
      profileUrl.value.isNotEmpty
          ? cachedImage.value = CachedNetworkImage(
        imageUrl: profileUrl.value,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.fill,
      )
          : const Image(
        image: AssetImage('assets/images/user_avatar.png'),
        width: 25,
        height: 25,
      );
    }

  }

  Future<UserResponse?> getUser() async {
    var userObj = await LocalStorageService().read(Constants.currentUser);
    if(userObj == null)
    {

      return null;
    }
    else
    {
      Map<String, dynamic> userMap = jsonDecode(userObj);
      debugPrint("user: $userMap");
      UserResponse user =  UserResponse.fromJson(userMap);
      return user;
    }

  }



}
