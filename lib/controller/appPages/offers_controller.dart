import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/search_conntroller.dart';

import '../../core/class/status_request.dart';
import '../../core/funcation/handling.dart';
import '../../data/datasource/remote/offers_data.dart';
import '../../data/model/items_model.dart';

abstract class OffersController extends SearchMaxController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  viewData();
}

class OffersControllerImp extends OffersController {
  @override
  void onInit() {
    search = TextEditingController();
    viewData();
    super.onInit();
  }

  @override
  viewData() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await offersData.getData();
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        List listData2 = res['data'];
        data.addAll(listData2.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }
}
