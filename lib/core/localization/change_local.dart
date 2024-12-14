import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../constant/app_theme.dart';
import '../funcation/fcm.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  Locale? languge;
  MyServices myServices = Get.find();

  ThemeData appTheme = themeEn;

  ChangeLang(String langCode) {
    Locale local = Locale(langCode);
    myServices.sharedPre.setString("lang", langCode);
    appTheme = langCode == 'ar' ? themeAr : themeEn;
    Get.changeTheme(appTheme);
    Get.updateLocale(local);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);
    if (!serviceEnabled) {
      return Get.snackbar("wrong", "you should open location");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("wrong", "please open location");
      }
      if (permission == LocationPermission.deniedForever) {
        return Get.snackbar(
            "no Way", "You cant use the app cuz of locatoin is not enable");
      }
    }
  }

  @override
  void onInit() {
    requestNotificain();
    fcmconfing();
    requestPerLocation();
    String? sharedPreLang = myServices.sharedPre.getString("lang");

    if (sharedPreLang == "ar") {
      languge = const Locale("ar");
      appTheme = themeAr;
    } else if (sharedPreLang == "en") {
      appTheme = themeEn;
      languge = const Locale("en");
    } else {
      languge = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
