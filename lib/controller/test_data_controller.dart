import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/funcation/handling.dart';
import '../data/datasource/remote/test_data.dart';

class TestDataController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getDataController() async {
    print("object");
    statusRequest = StatusRequest.loading;
    var res = await testData.getData();
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res['status'] == "success") {
        data.addAll(res["data"]);
      } else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }

  @override
  void onInit() {
    getDataController();
    super.onInit();
  }
}
