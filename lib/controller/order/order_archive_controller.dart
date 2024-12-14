import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/funcation/handling.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/account/order/order_archive_data.dart';
import '../../data/datasource/remote/account/order/order_pending_data.dart';
import '../../data/model/order_model.dart';

abstract class OrderArchiveController extends GetxController {
  OrderArchiveData orderArchiveData = OrderArchiveData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;

  List<OrderModel> data = [];
  orderPayment(String val);
  viewData();
  aadRatng(String orderId, double rating, String comment);

  orderStatus(String val);
}

class OrderArchiveControllerImp extends OrderArchiveController {
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

  @override
  viewData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var res =
        await orderArchiveData.getData(myServices.sharedPre.getString("id")!);
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      print(res);
      if (res['status'] == 'success') {
        List listdata = res['data'];
        data.addAll(listdata.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }

  @override
  aadRatng(orderId, rating, comment) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var res = await orderArchiveData.addRaingData(
          orderId.toString(), rating.toString(), comment);
      statusRequest = handling(res);
      if (statusRequest == StatusRequest.succes) {
        if (res["status"] == "success") {
          viewData();
        } else {
          statusRequest = StatusRequest.serverFailure;
        }
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
