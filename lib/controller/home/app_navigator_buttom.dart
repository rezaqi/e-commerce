import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/acc/account.dart';
import '../../view/screens/home/home.dart';
import '../../view/screens/offers.dart';
import '../../view/screens/setting.dart/setting.dart';

abstract class ANBController extends GetxController {
  goToPage(int currentPage);
}

class ANBControllerImp extends ANBController {
  int currentPage = 0;

  List<Widget> listPage = const [HomePage(), Offers(), Setting(), Account()];

  List listButton = [
    {"title": "home", "icon": Icons.home_outlined},
    {"title": "offers", "icon": Icons.local_offer},
    {"title": "setting", "icon": Icons.settings},
    {"title": "account", "icon": Icons.person_outline_rounded}
  ];

  @override
  goToPage(int i) {
    currentPage = i;
    update();
  }
}
