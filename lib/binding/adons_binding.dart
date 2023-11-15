import 'package:get/get.dart';
import 'package:lazure_cleaner/controller/adons_controller.dart';
import 'package:lazure_cleaner/controller/login_controller.dart';
import 'package:lazure_cleaner/controller/profile_controller.dart';
import 'package:lazure_cleaner/controller/verify_controller.dart';

class AdonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdonsController>(() => AdonsController());
  }

}