import 'package:get/get.dart';
import 'package:lazure_cleaner/controller/login_controller.dart';
import 'package:lazure_cleaner/controller/profile_controller.dart';
import 'package:lazure_cleaner/controller/vehicle_cleaning_proof_controller.dart';
import 'package:lazure_cleaner/controller/verify_controller.dart';
import 'package:lazure_cleaner/ui/vehicle_cleaning_proof.dart';
import 'package:lazure_cleaner/ui/vehicle_cleaning_proof.dart';
import 'package:lazure_cleaner/ui/vehicle_cleaning_proof.dart';

class VehicleCleaningProofBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleCleaningProofController>(() => VehicleCleaningProofController());
  }

}