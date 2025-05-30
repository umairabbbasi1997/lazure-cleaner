import 'package:get/get.dart';

class BookingDetails
{
  var userName = "".obs;

  static var isAccept = true.obs;
  static var isReject = true.obs;
  static var isArrived = false.obs;
  static var isCompleted = false.obs;
  static var isOnline = true.obs;
  static var isNewRide = false.obs;
  static var carPictureType = "";
  static var beforeCleaning = "before";
  static var afterCleaning = "after";
  static var customerName = "".obs;
  static var customerPhone = "".obs;
  static var customerAddress = "".obs;
  static var customerRegNo = "".obs;
  static var customerLat = "".obs;
  static var customerLng = "".obs;
  static var bookingId = "".obs;

  static var addonsId = <String>[].obs;

  static String? bookingCalculatedPrice = "";
  static String? bookingCurrencyCode = "";
}