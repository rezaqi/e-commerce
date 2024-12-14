import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/routs_name.dart';
import '../../../core/funcation/handling.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/address_data.dart';

abstract class AddAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController title = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();

  StatusRequest statusRequest = StatusRequest.loading;

  addAddress(double? lat, double? long);
  initialData();
}

class AddAddressControllerImp extends AddAddressController {
  @override
  initialData() {
    title = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  addAddress(lat, long) async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await addressData.addData(myServices.sharedPre.getString("id")!,
        title.text, city.text, street.text, lat!.toString(), long!.toString());
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      Get.offNamed(AppRouts.address);
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
