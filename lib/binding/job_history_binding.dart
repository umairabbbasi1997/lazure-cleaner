import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:lazure_cleaner/controller/job_history_controller.dart';

class JobHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobHistoryController>(() => JobHistoryController());
  }

}