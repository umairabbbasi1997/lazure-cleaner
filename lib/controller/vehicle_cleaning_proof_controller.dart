import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import '../utils/local_storage_service.dart';

class VehicleCleaningProofController extends GetxController{

  List<String> imageList = <String>[].obs;
  late ImagePickerPlus picker;

  @override
  void onInit() {

    super.onInit();
  }


  Future getImage(ImageSource source, BuildContext context) async {
    var image = await picker.pickImage(source: source);
    imageList.add(image!.selectedFiles.first.selectedFile.path);
  }




  Future<http.Response> uploadCarImages(BuildContext context, String type) async {

    try {
      Uri uriObj = Uri.parse('${Constants.baseURL}/bookings/190/images');

      context.loaderOverlay.show();

      var request = await http.MultipartRequest("POST", uriObj);


      var token = await LocalStorageService().read(Constants.jwToken);
      print(token);
      request.headers['Authorization'] = 'Bearer $token';


      request.fields['type'] = type;

      List<http.MultipartFile> imagesArray = <http.MultipartFile>[] ;


      for(var path in imageList){
       var img = await http.MultipartFile.fromPath('images[]', path) ;
       imagesArray.add(img) ;
      }

      request.files.addAll(imagesArray);


      var response = await request.send();

      context.loaderOverlay.hide();
      http.Response responded = await http.Response.fromStream(response);
      print("Result: ${responded.statusCode}");
      print("Body: ${responded.body}");




      var  succes = jsonDecode(responded.body)['success'];

      if(succes)
      {

        var jsonResult = jsonDecode(responded.body)['data'];
        print(jsonResult.toString());


      }
      else{

        var  message = jsonDecode(responded.body)['message'];

        Get.snackbar("Error", message,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }




      return responded;

    } catch (err) {
      debugPrint("error: "+err.toString());
      context.loaderOverlay.hide();
      rethrow;
    }
  }




}