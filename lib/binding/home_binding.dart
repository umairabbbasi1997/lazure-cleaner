import 'package:get/get.dart';
import 'package:lazure_cleaner/controller/home_controller.dart';
import 'package:lazure_cleaner/controller/login_controller.dart';
import 'package:lazure_cleaner/controller/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }

}