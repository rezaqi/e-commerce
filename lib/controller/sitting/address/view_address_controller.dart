import 'package:get/get.dart';
import '../../../core/class/status_request.dart';
import '../../../core/funcation/handling.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/address_data.dart';
import '../../../data/model/address_model.dart';

abstract class ViewAddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.loading;
  List<AddressModel> data = [];

  viewDataA();
  deleteDataA(String addressId);
}

class ViewAddressViewControllerImp extends ViewAddressViewController {
  @override
  viewDataA() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await addressData.getData(
      myServices.sharedPre.getString("id")!,
    );
    statusRequest = handling(res);

    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        List resData = res['data'];

        data.addAll(resData.map((e) => AddressModel.fromJson(e)));
      }
    } else {
      statusRequest == StatusRequest.empty;
      print(statusRequest);
    }
    update();
  }

  @override
  deleteDataA(addressId) async {
    addressData.deleteData(addressId);
    data.removeWhere(
      (element) => element.addressId == addressId,
    );

    update();
  }

  @override
  void onInit() {
    viewDataA();
    super.onInit();
  }
}
