import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';

import '../utils/constants.dart';
import '../utils/local_storage_service.dart';

class ApiService {
  Future<Map<String, String>> getReqHeaders() async {
    var token = await LocalStorageService().read(Constants.jwToken);
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
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
      /*if (response.statusCode == 401) {
        //await refreshAuthToken();
        reqHeaders = await getReqHeaders();
        response = await http.post(
          uriObj,
          body: jsonEncode(body),
          headers: headers ?? reqHeaders,
        );
      }*/

      return response;
    } catch (err) {
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
      /*if (response.statusCode == 401) {
        //await refreshAuthToken();
        reqHeaders = await getReqHeaders();
        response = await http.get(
          uriObj,
          headers: headers ?? reqHeaders,
        );
      }*/

      return response;
    } catch (err) {
      rethrow;
    }
  }
}