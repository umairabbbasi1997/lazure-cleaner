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