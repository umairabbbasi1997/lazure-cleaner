import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api_service/api_services.dart';
import '../model/JobHistoryData.dart';
import '../utils/constants.dart';


class JobHistoryController extends GetxController {

  List<JobHistoryData> jobList = <JobHistoryData>[].obs;

  void getJobListList(BuildContext context) async {
    try {
      var url = Constants.JOB_HISTORY_URL;


      var res = await ApiService().get(url,context);
      if (res.statusCode != 200) {
//        handleRes(res);
        debugPrint("responseCode: "+res.statusCode.toString());
      }


      var pListJson = jsonDecode(res.body);
      List<JobHistoryData> tempList = [];
      pListJson['data'].forEach((item) {
        tempList.add(JobHistoryData.fromJson(item));
      });

      jobList.clear();
      jobList = tempList;
      print(jobList.toString());

//      isPaymentHistoryLoading = false;
    } catch (err) {
      //    isPaymentHistoryLoading = false;
      //  showErrorDialog(err is String ? err : 'Could not load payment history'+err.toString());
    }
  }

}