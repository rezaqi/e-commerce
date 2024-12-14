import 'package:get/get.dart';

import '../services/services.dart';

TranData(Ar, En) {
  MyServices myServices = Get.find();
  if (myServices.sharedPre.getString("lang") == "ar") {
    return Ar;
  } else {
    return En;
  }
}
