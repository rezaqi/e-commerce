import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/funcation/handling.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  StatusRequest? statusRequest;
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();

  Map isFav = {};

  @override
  setFav(id, val) {
    isFav[id] = val;
    update();
  }

  addFav(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await favoriteData.addFav(
        myServices.sharedPre.getString("id")!, itemId);
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        Get.snackbar("correct", "ur item add to fav");
      } else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }

  removetFav(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await favoriteData.removeFav(
        myServices.sharedPre.getString("id")!, itemId);
    statusRequest = handling(res);
    if (statusRequest == StatusRequest.succes) {
      if (res["status"] == "success") {
        Get.snackbar("remove", "your item removed from fav");
      } else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }
}
