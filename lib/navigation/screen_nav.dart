import 'package:get/get.dart';
import 'package:lazure_cleaner/binding/adons_binding.dart';
import 'package:lazure_cleaner/binding/change_password_binding.dart';
import 'package:lazure_cleaner/binding/job_history_binding.dart';
import 'package:lazure_cleaner/binding/login_binding.dart';
import 'package:lazure_cleaner/binding/profile_binding.dart';
import 'package:lazure_cleaner/binding/vehicle_cleaning_proof_binding.dart';
import 'package:lazure_cleaner/binding/verify_binding.dart';
import 'package:lazure_cleaner/controller/adons_controller.dart';
import 'package:lazure_cleaner/navigation/nav_paths.dart';
import 'package:lazure_cleaner/ui/adons_screen.dart';
import 'package:lazure_cleaner/ui/change_password_screen.dart';
import 'package:lazure_cleaner/ui/collect_payment.dart';
import 'package:lazure_cleaner/ui/edit_profile_screen.dart';
import 'package:lazure_cleaner/ui/home_screen.dart';
import 'package:lazure_cleaner/ui/job_complete_screen.dart';
import 'package:lazure_cleaner/ui/job_history_screen.dart';
import 'package:lazure_cleaner/ui/login_screen.dart';
import 'package:lazure_cleaner/ui/signup_screen.dart';
import 'package:lazure_cleaner/ui/splash_screen.dart';
import 'package:lazure_cleaner/ui/upload_car_details.dart';
import 'package:lazure_cleaner/ui/vehicle_cleaning_proof.dart';
import 'package:lazure_cleaner/ui/verified_screen.dart';
import 'package:lazure_cleaner/ui/verify_account_screen.dart';

import '../binding/home_binding.dart';

class NavPaths {
  static final screens = [
    GetPage(name: navHome, page: () =>  HomeScreen(),binding :HomeBinding()),
    GetPage(name: navLogin, page: () => LoginScreen(), binding:LoginBinding() ),
    GetPage(name: navSignup, page: () => const SignupScreen()),
    GetPage(name: navCollectPayment, page: () =>  CollectPayment()),
    GetPage(name: navUploadCarDetails, page: () =>  UploadCarDetails(),binding: VerifyBinding()),
    GetPage(name: navVerifyAccountScreen, page: () => VerifyAccountScreen()),
    GetPage(name: navVerified, page: () => VerifiedScreen()),
    GetPage(name: navSplash, page: () => SplashScreen()),
    GetPage(name: navJobComplete, page: () => JobCompleteScreen()),
    GetPage(name: navEditProfile, page: () => EditProfileScreen() , binding:ProfileBinding())
    ,GetPage(name: navChangePassword, page: () => ChangePasswordScreen(),binding:ChangePasswordBinding()),
  GetPage(name: navJobHistory, page: () => JobHistoryScreen(),binding:JobHistoryBinding()),
    GetPage(name: navVehicleCleaningProof, page: () => VehicleCleaningProof(),binding:VehicleCleaningProofBinding()),
    GetPage(name: navAdons, page: () => AdonsScreen(),binding:AdonsBinding()),
  ];
}
