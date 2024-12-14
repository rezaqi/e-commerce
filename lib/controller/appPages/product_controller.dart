import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/funcation/handling.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart_data.dart';
import '../../data/model/items_model.dart';

abstract class ProductsController extends GetxController {
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  changeColor(String val);
  initData();
  late ItemsModel itemsModel;
  String? deliveryTime;
  String? selected;
  int coutItem = 0;
  addCart(itemId);
  deleteCart(itemId);
  countCard(String itemId);
}

class ProductsControllerImp extends ProductsController {
  @override
  initData() async {
    statusRequest = StatusRequest.loading;
    update();
    deliveryTime = myServices.sharedPre.getString("deliverytime");
    print("++++++++++++++++++++++");
    print(deliveryTime);
    print("++++++++++++++++++++++");
    itemsModel = Get.arguments['itemsModel'];
    selected = Get.arguments['selected'];
    coutItem = await countCard(itemsModel.itemsId!);
    statusRequest = StatusRequest.succes;
    update();
  }

  add() {
    addCart(itemsModel.itemsId);
    coutItem++;
    update();
  }

  remove() {
    deleteCart(itemsModel.itemsId);
    if (coutItem > 0) {
      coutItem--;
    }
    update();
  }

  @override
  addCart(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await cartData.addCart(
        myServices.sharedPre.getString("id")!, itemId.toString());
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        Get.snackbar("cart", "your item add to cart");
      } else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }

  @override
  deleteCart(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    await cartData.deleteCart(
        myServices.sharedPre.getString("id")!, itemId.toString());
  }

  @override
  countCard(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await cartData.getCountCart(
        myServices.sharedPre.getString("id")!, itemId);
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      coutItem = res["data"];
      print("==============================");
      print(coutItem);
      return coutItem;
    } else {
      statusRequest = StatusRequest.empty;
    }
    update();
  }

  List subTitle = [
    {"color": Colors.redAccent, "id": 1, "active": true},
    {"color": Colors.blueAccent, "id": 2, "active": false},
    {"color": Colors.lime, "id": 3, "active": false}
  ];

  @override
  changeColor(String val) {
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
