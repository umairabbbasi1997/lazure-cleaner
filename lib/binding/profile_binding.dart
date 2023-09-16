import 'package:get/get.dart';
import 'package:lazure_cleaner/controller/login_controller.dart';
import 'package:lazure_cleaner/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}