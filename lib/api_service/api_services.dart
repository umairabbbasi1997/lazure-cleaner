import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';

import '../utils/constants.dart';
import '../utils/local_storage_service.dart';

class ApiService {
  Future<Map<String, String>> getReqHeaders() async {
    var token = await LocalStorageService().read(Constants.jwToken);
    return {
      'Content-type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
  }





  Future<Map<String, String>> getPlatReaderHeaders() async {
    var token = await LocalStorageService().read(Constants.jwToken);
    return {
/*      'Content-type': 'application/json',*/
      'Accept': 'application/json',
      'Authorization': 'Token 8e13dfc62d0bd85b29c1f938d77c6edb68380aed'
    };
  }

  Future<http.Response> post(String url,BuildContext context,
      {Map<String, dynamic>? body}) async {
    try {
      Uri uriObj = Uri.parse(url);
      Map<String, String> reqHeaders = await getReqHeaders();

      http.Response response;

      context.loaderOverlay.show();

      response = await http.post(
        uriObj,
        body: jsonEncode(body),
        headers: reqHeaders,
      );

      context.loaderOverlay.hide();
      context.loaderOverlay.hide();

      var success = jsonDecode(response.body)['success'] ?? false;

      if(success)
      {
        return response;
      }
      else{
        var message = jsonDecode(response.body)['message'];

        Get.snackbar("Error", message,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }

      return response;
    } catch (err) {
      debugPrint("error: "+err.toString());
      rethrow;
    }
  }


  Future<http.Response> postPlatReader(BuildContext context,
      String imagepath) async {

    try {
      Uri uriObj = Uri.parse(Constants.PLAT_READER_URL);

      context.loaderOverlay.show();

      var request = await http.MultipartRequest("POST", uriObj);

      request.headers['Authorization'] = 'Token 8e13dfc62d0bd85b29c1f938d77c6edb68380aed';

      var multipart = await http.MultipartFile.fromPath('upload', imagepath);
          request.files.add(multipart);

          var response = await request.send();
      http.Response responded = await http.Response.fromStream(response);
      print("Result: ${responded.statusCode}");
      print("Body: ${responded.body}");
      return responded;

/*
      {
        "processing_time":52.725,
    "results":[
    {
    "box":{
    "xmin":2,
    "ymin":2,
    "xmax":628,
    "ymax":308
    },
    "plate":"afr420",
    "region":{
    "code":"gb",
    "score":0.198
    },
    "score":0.89,
    "candidates":[
    {
    "score":0.89,
    "plate":"afr420"
    },
    {
    "score":0.888,
    "plate":"afr42o"
    }
    ],
    "dscore":0.772,
    "vehicle":{
    "score":0.0,
    "type":"Unknown",
    "box":{
    "xmin":0,
    "ymin":0,
    "xmax":0,
    "ymax":0
    }
    }
    }
    ],
    "filename":"0849_c7DgX_image_crop_a0dee54d-3baf-4a37-910c-cd05219f1ff8652822549939313478.jpg",
    "version":1,
    "camera_id":null,
    "timestamp":"2023-10-28T08:49:42.009170Z"
    }*/
    /*  request.send().then((response) {


        mresponse = response ;

        if(response.statusCode == 201)
        {
          print("Uploaded!");
          response.stream.transform(utf8.decoder).listen((value) {
            print(value);
          });

          return mresponse;

        }
        else{


          Get.snackbar("Error", "message",
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.red);

          return mresponse;
        }


      });

*/
    } catch (err) {
      debugPrint("error: "+err.toString());
      rethrow;
    }
  }

  Future<http.Response> get(String url,BuildContext context, {Map<String, String>? headers}) async {
    try {
      Uri uriObj = Uri.parse(url);
      Map<String, String> reqHeaders = await getReqHeaders();

      http.Response response;

      context.loaderOverlay.show();

      response = await http.get(
        uriObj,
        headers: reqHeaders,
      );

      context.loaderOverlay.hide();
      context.loaderOverlay.hide();

      var success = jsonDecode(response.body)['success'] ?? false;

      if(success)
      {
        return response;
      }
      else{
        var message = jsonDecode(response.body)['message'];

        Get.snackbar("Error", message,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }

      return response;
    } catch (err) {
      debugPrint("error: "+err.toString());
      rethrow;
    }
  }
}