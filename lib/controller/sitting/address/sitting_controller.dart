import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../../core/constant/routs_name.dart';
import '../../../core/services/services.dart';
abstract class SittingController extends GetxController {
  MyServices myServices = Get.find();
  logout();
}

class SittingControllerImp extends SittingController {
  @override
  logout() {
    String userId = myServices.sharedPre.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("user");
    FirebaseMessaging.instance.unsubscribeFromTopic("user${userId}");
    myServices.sharedPre.clear();
    Get.offAllNamed(AppRouts.login);
  }
}
