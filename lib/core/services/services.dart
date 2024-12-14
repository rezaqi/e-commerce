import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPre;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    sharedPre = await SharedPreferences.getInstance();
    return this;
  }
}

// ignore: non_constant_identifier_names
InitialServices() async {
  await Get.putAsync(() => MyServices().init());
}
