import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../core/funcation/handling.dart';
import '../../data/datasource/remote/account/order/order_detils_data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/order_model.dart';

abstract class DetilsController extends GetxController {
  OrderDetilsData orderDetilsData = OrderDetilsData(Get.find());

  late OrderModel orderModel;
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completerCurrent;
  Position? position;
  List<Marker> marker = [];
  CameraPosition? KGooglePiex;
  double? lat;
  double? long;

  List<CartModel> data = [];

  initailData();
  orderStatus(String val);
  orderPayment(String val);
  viewData();
}

class DetilsControllerImp extends DetilsController {
  @override
  void onInit() {
    orderModel = Get.arguments['ordermodel'];
    initailData();
    viewData();
    super.onInit();
  }

  @override
  initailData() {
    completerCurrent = Completer<GoogleMapController>();
    KGooglePiex = CameraPosition(
        target: LatLng(orderModel.addressLat!, orderModel.addressLong!),
        zoom: 12);
    marker.add(Marker(
        markerId: MarkerId("1"),
        position: LatLng(orderModel.addressLat!, orderModel.addressLong!)));
  }

  @override
  viewData() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await orderDetilsData.getData(orderModel.orderId!);

    statusRequest = handling(res);

    if (statusRequest == StatusRequest.succes) {
      if (res['status'] == 'success') {
        print("goo");
        List listdata = res['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }

  @override
  orderStatus(val) {
    if (val == "0") {
      return "order is pending";
    } else if (val == "1") {
      return "order is perpre";
    } else if (val == "2") {
      return "order with delivery";
    } else if (val == "3") {
      return "order on the way";
    } else {
      return "with you";
    }
  }

  @override
  orderPayment(val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }
}
