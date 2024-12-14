import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/routs_name.dart';
import '../../core/funcation/handling.dart';
import '../../data/datasource/remote/search_data.dart';
import '../../data/model/items_model.dart';

class SearchMaxController extends GetxController {
  SearchData searchData = SearchData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  TextEditingController? search;
  bool isSearch = false;
  bool? isSearcho;
  String val = "";
  List<ItemsModel> dataSearch = [];

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  serach() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await searchData.searchData(search!.text);
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == 'success') {
        dataSearch.clear();
        List listDataSearch = res["data"];
        dataSearch.addAll(listDataSearch.map((e) => ItemsModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.empty;
    }
    update();
  }

  checkSearch(val, isSearch) {
    if (val == "") {
      isSearch = false;
    } else {
      isSearch = true;
    }
    print(isSearch);

    update();
  }

  onSearch(val) async {
    if (val == "") {
      isSearch = false;
    } else {
      await serach();
      isSearch = true;
    }

    update();
  }

  goToProductSearch(itemsModel) {
    Get.toNamed(AppRouts.product, arguments: {"itemsModel": itemsModel});
  }
}
