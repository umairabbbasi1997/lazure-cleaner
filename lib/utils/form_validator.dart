import 'package:get/get_utils/src/get_utils/get_utils.dart';

class FormValidator {
  static String? nameValidator(value) {
    bool isName =
        RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$")
            .hasMatch(value);
    if (value == "") {
      return "Name field cannot be empty";
    }
    if (!isName) {
      return "Enter a valid name";
    }
    return null;
  }

  static String? separateNameValidator(value) {
    if (value == "") {
      return "Name field cannot be empty";
    }
    if (!GetUtils.isAlphabetOnly(value)) {
      return "Enter a valid Name";
    }
    return null;
  }
  static String? emailValidator(value) {
    if (value == "") {
      return "Email field cannot be empty";
    }
    if (!GetUtils.isEmail(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  // static String? passwordValidator(value) {
  //   if (value == "") {
  //     return "Password field cannot be empty";
  //   }
  //   if (!GetUtils.isLengthGreaterThan(value, 6)) {
  //     return "Enter at least 7 characters";
  //   }
  //   return null;
  // }

    static String? passwordValidator(value) {
    String PASSWORDPATTERN =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(PASSWORDPATTERN);
    if (value == "") {
      return "Password field cannot be empty";
    }

    if (!regExp.hasMatch(value)) {
      return "Must contain 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character";
    }
    return null;
  }

  static String? passwordValidatorLogin(value) {
    if (value == "") {
      return "Password field cannot be empty";
    }
    if (!GetUtils.isLengthGreaterThan(value, 7)) {
      return "Must contain 8 characters";
    }
    return null;
  }


  static String? confirmPasswordValidator(password, value) {
    if (value == "") {
      return "Confirm Password field cannot be empty";
    }
    if (password != value) {
      return "Passowrds does not match";
    }
    return null;
  }

  static String? phoneValidator(value) {
    if (value == "") {
      return "Number field cannot be empty";
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return "Enter valid phone number";
    }
    return null;
  }

  static String? zipValidator(value) {
    if (value == "") {
      return "Zip field cannot be empty";
    }
    if (!GetUtils.isNumericOnly(value)) {
      return "Enter valid zip number";
    }
    return null;
  }

  static String? usernameValidator(value) {
    if (value == "") {
      return "Username field cannot be empty";
    }
    if (!GetUtils.isUsername(value)) {
      return "Enter a valid username";
    }
    return null;
  }

    static String? emptyValidator(value) {
    if (value == null || value == "") {
      return "Field cannot be empty";
    }
    return null;
  }

}
