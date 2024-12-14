import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/funcation/handling.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/account/order/order_pending_data.dart';
import '../../data/model/order_model.dart';

abstract class OrderController extends GetxController {
  OrderPendingData orderData = OrderPendingData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;

  List<OrderModel> data = [];
  viewData();
  deleteDetils(String orderId);
  orderPayment(String val);
  orderStatus(String val);
  refreshOrdre();
}

class OrderControllerImp extends OrderController {
  @override
  orderPayment(val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
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
  refreshOrdre() {
    data.clear();
    viewData();
  }

  @override
  viewData() async {
    statusRequest = StatusRequest.loading;
    update();
    print("enter");
    var res = await orderData.getData(myServices.sharedPre.getString("id")!);
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        List listData = res["data"];
        data.addAll(listData.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }

  @override
  deleteDetils(orderId) async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await orderData.deletData(orderId);
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        refreshOrdre();
      } else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
