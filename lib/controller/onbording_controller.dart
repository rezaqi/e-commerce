import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routs_name.dart';
import '../core/services/services.dart';
import '../data/datasource/static/static.dart';
abstract class OnBordingControlller extends GetxController {
  next();
  skip();
  onChanged(int index);
}

class OnBordingControllerImp extends OnBordingControlller {
  late PageController pageController;
  int currentPage = 0;
  MyServices _myServices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onBordingList.length - 1) {
      _myServices.sharedPre.setString("step", "1");
      Get.offAllNamed(AppRouts.auth);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  @override
  onChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  skip() {
    currentPage = 2;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
