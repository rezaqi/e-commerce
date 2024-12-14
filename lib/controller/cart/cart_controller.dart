import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routs_name.dart';
import '../../core/funcation/handling.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart_data.dart';
import '../../data/datasource/remote/coupon._data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/coupon_model.dart';

abstract class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  CouponData couponData = CouponData(Get.find());

  TextEditingController cText = TextEditingController();

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;
  List<CartModel> data = [];
  CouponModel? couponModel;
  dynamic totalPriceItems;
  int? couponDiscount = 0;
  String? couponName;
  String? couponId;
  int totalCountItems = 0;
  int coutItem = 0;
  addCart(String itemId);
  deleteCart(String itemId);
  view();
  getTotalPrice();
  checkCoupon();
  goToCheckout();
}

class CartControllerImp extends CartController {
  @override
  addCart(itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    print("Add");
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
    await cartData.deleteCart(myServices.sharedPre.getString("id")!, itemId);
    statusRequest = StatusRequest.succes;
    update();
  }

  restPage() {
    totalCountItems = 0;
    totalPriceItems = 0;
    coutItem = 0;
    data.clear();
  }

  refreshPage() {
    restPage();
    view();
  }

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await cartData.view(myServices.sharedPre.getString("id")!);
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        if (res["datacart"]["status"] == "success") {
          List dataRes = res["datacart"]['data'];
          Map dataResCountPrice = res["countprice"];
          data.clear();
          data.addAll(dataRes.map((e) => CartModel.fromJson(e)));
          totalCountItems = dataResCountPrice['totalcount'];
          totalPriceItems = dataResCountPrice['totalprice'];
        } else {
          statusRequest = StatusRequest.empty;
          print(statusRequest);
        }
      }
    }
    update();
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await couponData.getData(cText.text);
    statusRequest = handling(res);

    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        Map<String, dynamic> dataRes = res["data"];
        couponModel = CouponModel.fromJson(dataRes);
        couponDiscount = couponModel!.couponDiscount;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId.toString();
      } else {
        couponDiscount = 0;
        couponId = null;
        couponName = null;
        Get.snackbar("Wrong", "This coupon no unavailable");
      }
    }
    update();
  }

  @override
  getTotalPrice() {
    return (totalPriceItems - totalPriceItems * couponDiscount / 100);
  }

  @override
  void onInit() {
    cText = TextEditingController();

    view();
    super.onInit();
  }

  @override
  goToCheckout() {
    if (data.isEmpty) return Get.snackbar("Worng", "your cart is empty");
    Get.toNamed(AppRouts.checkout, arguments: {
      "price": totalPriceItems,
      "couponid": couponId ?? "0",
      "cupondiscount": couponDiscount
    });
  }
}
