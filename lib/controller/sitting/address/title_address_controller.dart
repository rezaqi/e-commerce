// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rezaqi_ecommerce/core/class/status_request.dart';
// import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
// import 'package:rezaqi_ecommerce/core/funcation/handling.dart';
// import 'package:rezaqi_ecommerce/core/services/services.dart';
// import 'package:rezaqi_ecommerce/data/datasource/remote/address_data.dart';

// abstract class TitleAddressController extends GetxController {
//   AddressData addressData = AddressData(Get.find());
//   MyServices myServices = Get.find();

//   TextEditingController title = TextEditingController();
//   TextEditingController city = TextEditingController();
//   TextEditingController street = TextEditingController();
//   late StatusRequest statusRequest;

//   double? lat;
//   double? long;

//   initialData();
//   addAddress();
//   editDataA(String title, String city, String street);
//   deleteDataA();
// }

// class TitleAddressControllerImp extends TitleAddressController {
//   @override
//   initialData() {
//     // lat = Get.arguments["lat"];
//     // long = Get.arguments["long"];
//     title = TextEditingController();
//     city = TextEditingController();
//     street = TextEditingController();
//   }

//   @override
//   void onInit() {
//     initialData();
//     super.onInit();
//   }

//   @override
//   deleteDataA() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var res =
//         await addressData.deleteData(myServices.sharedPre.getString("id")!);
//     statusRequest = handling(res);
//     if (statusRequest == StatusRequest.succes) {
//       if (res["status"] == "success") {}
//     } else {
//       statusRequest = StatusRequest.serverFailure;
//     }
//     update();
//   }

//   @override
//   editDataA(title, city, street) async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var res = await addressData.editData(myServices.sharedPre.getString("id")!,
//         title, city, street, lat!, long!);
//     statusRequest = handling(res);
//     if (statusRequest == StatusRequest.succes) {
//       if (res["status"] == "success") {}
//     } else {
//       statusRequest = StatusRequest.serverFailure;
//     }
//     update();
//   }

//   @override
//   addAddress() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var res = await addressData.addData(myServices.sharedPre.getString("id")!,
//         title.text, city.text, street.text, lat! as String, long! as String);
//     statusRequest = handling(res);
//     if (statusRequest == StatusRequest.succes) {
//       if (res["status"] == "success") {
//         Get.offNamed(AppRouts.address);
//       }
//     } else {
//       statusRequest = StatusRequest.serverFailure;
//     }
//     update();
//   }
// }
