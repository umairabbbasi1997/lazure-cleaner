import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lazure_cleaner/model/AddAddonsResponse.dart';

import '../api_service/api_services.dart';
import '../constants/BookingDetails.dart';
import '../model/SelectServiceModel.dart';
import '../navigation/nav_paths.dart';
import '../utils/constants.dart';

class AdonsController extends GetxController{

  @override
  void onInit() {
    super.onInit();

    getServiceList(Get.context!);
  }

  List<SelectServiceModel> selectServiceList = <SelectServiceModel>[].obs;




  Future<void> getServiceList(BuildContext context) async {
    try {
      var url = Constants.SELECT_SERVICE;

      Map<String,String> param =
      {"is_addons":"1"};


      var res = await ApiService().post(url,context,body: param);
      if (res.statusCode != 200) {
//        handleRes(res);
        debugPrint("responseCode: "+res.statusCode.toString());
      }


      selectServiceList.clear();
      var pListJson = jsonDecode(res.body);
      pListJson['data'].forEach((item) {
        selectServiceList.add(SelectServiceModel.fromJson(item));
      });


//      isPaymentHistoryLoading = false;
    } catch (err) {
      debugPrint("responseCode: "+err.toString());
      //    isPaymentHistoryLoading = false;
      //  showErrorDialog(err is String ? err : 'Could not load payment history'+err.toString());
    }
  }




  Future<void> addAddons(BuildContext context) async {
    try {
      var url = Constants.ADD_ADDONS;

      Map<String,Object> param =
      {"booking_id": "190",//BookingDetails.bookingId.value,
        "services":BookingDetails.addonsId
      };


      var res = await ApiService().post(url,context,body: param);
      if (res.statusCode != 200) {
//        handleRes(res);
        debugPrint("responseCode: "+res.statusCode.toString());
      }


      var jsonResult = jsonDecode(res.body)['data'];


      var addAddOnResponse = AddAddonsResponse.fromJson(jsonResult);

      BookingDetails.bookingCalculatedPrice = addAddOnResponse.price.toString();
      BookingDetails.bookingCurrencyCode = addAddOnResponse.currencyCode.toString();
      Get.toNamed(navVehicleCleaningProof);


    } catch (err) {
      debugPrint("responseCode: "+err.toString());
      //    isPaymentHistoryLoading = false;
      //  showErrorDialog(err is String ? err : 'Could not load payment history'+err.toString());
    }
  }
}