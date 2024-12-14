import 'package:get/get.dart';

validatInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "it's not username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "it's not email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "it's not Phone Number";
    }
  }

  if (val.length < min) {
    return "too Short";
  }
  if (val.length > max) {
    return "too Long";
  }
}
