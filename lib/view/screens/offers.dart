import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/offers_controller.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/view/widget/home/custom_title.dart';
import 'package:rezaqi_ecommerce/view/widget/home/list_search.dart';

import '../../core/constant/routs_name.dart';
import '../widget/offers_custom.dart';

class Offers extends GetView<OffersControllerImp> {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImp());
    return Scaffold(
        body: Column(
      children: [
        CustomTitle(
          title: "Offers",
          ontapMyfavorite: () {
            Get.toNamed(AppRouts.myfavorite);
          },
          ontapNotification: () {
            Get.toNamed(AppRouts.notification);
          },
        ),
        controller.isSearch
            ? CustomListSearch(
                listSearch: controller.dataSearch,
              )
            : GetBuilder<OffersControllerImp>(builder: (controller) {
                return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: CustomListOffers());
              }),
      ],
    ));
  }
}
