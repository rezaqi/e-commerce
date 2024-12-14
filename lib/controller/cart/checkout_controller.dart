import 'package:get/get.dart';


import '../../core/class/status_request.dart';
import '../../core/constant/routs_name.dart';
import '../../core/funcation/handling.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address_data.dart';
import '../../data/datasource/remote/oreder_data.dart';
import '../../data/model/address_model.dart';

abstract class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  OrderData orderData = Get.put(OrderData(Get.find()));
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.loading;

  List<AddressModel> dataAddress = [];
  String? paymentMethod;
  int? paymentMethodNum;
  String? idAddress;
  dynamic totalPrice;
  late String couponDiscunt;
  late String couponId;

  chossePaymentMethod(String val);
  chosseAddress(String val);
  getAddress();
  ordercheck();
}

class CheckoutControllerImp extends CheckoutController {
  @override
  chossePaymentMethod(val) {
    paymentMethod = val;
    if (paymentMethod == 'cash') {
      paymentMethodNum = 0;
    } else {
      paymentMethodNum = 1;
    }
    update();
  }

  @override
  chosseAddress(val) {
    idAddress = val;
    print(idAddress);
    update();
  }

  @override
  getAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await addressData.getData(
      myServices.sharedPre.getString("id")!,
    );

    statusRequest = handling(res);

    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        List resData = res['data'];
        print("-------------------su");
        print(resData);
        dataAddress.addAll(resData.map((e) => AddressModel.fromJson(e)));
      }
    } else {
      statusRequest == StatusRequest.empty;
      print("---------------false");
      print(statusRequest);
    }
    update();
  }

  @override
  ordercheck() async {
    if (paymentMethodNum == null) {
      return Get.snackbar("Wrong", "please chosse the paiment methode");
    }

    if (idAddress == null) {
      return Get.snackbar("Wrong", "please chosse your address");
    }

    statusRequest = StatusRequest.loading;
    update();
    int useri = int.tryParse(myServices.sharedPre.getString("id")!)!.toInt();
    Map data = {
      "userid": useri.toString(),
      "addressId": idAddress.toString(),
      "deliveryPrice": '10',
      "price": totalPrice.toString(),
      "coupoid": couponId.toString(),
      'cupondiscount': couponDiscunt.toString(),
      "payment": paymentMethod.toString(),
    };
    print(data);
    var res = await orderData.orderAdd(data);
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        Get.snackbar("Success", "your order is seccess");
        Get.offAllNamed(AppRouts.homeScreen);
      } else {
        statusRequest = StatusRequest.empty;
        return Get.snackbar("Wrong", "please try again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponid'].toString();
    totalPrice = Get.arguments['price'];
    couponDiscunt = Get.arguments['cupondiscount'].toString();
    getAddress();
    super.onInit();
  }
}
