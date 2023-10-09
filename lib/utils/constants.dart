class Constants {

  /* Local Storage */
  static const String jwToken = 'jwToken';
  static const String fcmToken = 'fcmToken';
  static const String currentUser = 'currentUser';
  static const String currentUserId = 'currentUserId';
  static const String IS_FIRST_TIME = 'isFirstTime';
  static const String IS_ONLINE = "is_online";

  //*********LIVE Base URL**************
  static String baseURL =
      'http://143.110.190.6/api/v1/cleaner';

  //*************Relative URLs*************
  static String loginURL = '$baseURL/login';

  static String profileUpdateURL = '$baseURL/profile/update';
  static String CHANGE_PASSWORD_URL = '$baseURL/profile/change-password';
  static String LOGOUT_URL = '$baseURL/logout';
  static String SWITCH_ONLINE_STATUS_URL = '$baseURL/change-online-status';
  static String ACCEPT_JOB_URL = '$baseURL/bookings/accepted';
  static String REJECT_JOB_URL = '$baseURL/bookings/rejected';
  static String ARRIVED_JOB_URL = '$baseURL/bookings/arrived';
  static String COMPLETED_JOB_URL = '$baseURL/bookings/completed';











  //constant

}