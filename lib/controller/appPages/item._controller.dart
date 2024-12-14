import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/search_conntroller.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routs_name.dart';
import '../../core/funcation/handling.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/model/items_model.dart';
import '../../data/model/rating_model.dart';

abstract class ItemController extends SearchMaxController {
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  ItemsModel? itemsModel;
  RatingModel? ratingModel;
  initData();
  getItems(String catId);
  changeCat(int val, String catVal);
  goToProduct(
    ItemsModel itemsModel,
  );
  // viewRating(String itemId);
  start(int star, String itemId, String itemIdR);
  List data = [];
  List categories = [];
  List<RatingModel> dataRating = [];
  List listRating = [];
  List comments = [];
  // String? star;
  String? catId;
  int? selectedCat;
}

class ItemControllerImp extends ItemController {
  @override
  initData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selected'];
    catId = Get.arguments['categories_id'];
    getItems(catId!);
  }

  @override
  changeCat(val, catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(catId!);
    update();
  }

  @override
  void onInit() {
    initData();
    // viewRating("9");
    super.onInit();
  }

  @override
  getItems(catId) async {
    try {
      data.clear();
      statusRequest = StatusRequest.loading;
      update();
      var res =
          await itemsData.getData(catId, myServices.sharedPre.getString("id")!);
      statusRequest = handling(res);
      if (statusRequest == StatusRequest.succes) {
        if (res["status"] == "success") {
          data.clear();
          data.addAll(res["data"]);
        } else {
          statusRequest == StatusRequest.empty;
        }
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  // @override
  // viewRating(itemsModel) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var res = await itemsData.getItemRating(itemsModel.toString());
  //   statusRequest = handling(res);
  //   if (statusRequest == StatusRequest.succes) {
  //     print("enter");
  //     print(res);
  //     if (res["status"] == "success") {
  //       List listRating = res["data"];

  //       dataRating.addAll(listRating.map((e) => RatingModel.fromJson(e)));

  //       // star = res["data"]["comments"].toString();
  //       // comments.addAll(listRating["comments"]);
  //     } else {
  //       statusRequest = StatusRequest.empty;
  //     }
  //   }
  // }

  @override
  goToProduct(itemsModel) {
    Get.toNamed(AppRouts.product, arguments: {"itemsModel": itemsModel});
  }

  @override
  start(star, itemId, itemIdR) {
    print("--------------");
    print(itemId);
    print("--------------");
    print(star);

    if (star == 0 && itemId == itemIdR) {
      return Row(children: [
        ...List.generate(
            5,
            (index) => const Icon(
                  Icons.star_outline_sharp,
                  size: 19,
                ))
      ]);
    }
    ///////////////////////////
    if (star >= 1 && star < 2 && itemId == itemIdR) {
      return Row(
        children: [
          Icon(Icons.star, color: Colors.yellow, size: 19),
          ...List.generate(
              4,
              (index) => const Icon(
                    Icons.star_outline_sharp,
                    size: 19,
                  ))
        ],
      );
    }
    ///////////////////////////
    if (star >= 2 && star < 3 && itemId == itemIdR) {
      return Row(
        children: [
          Icon(Icons.star, color: Colors.yellow, size: 19),
          Icon(Icons.star, color: Colors.yellow, size: 19),
          ...List.generate(
              3,
              (index) => const Icon(
                    Icons.star_outline_sharp,
                    size: 19,
                  ))
        ],
      );
    }
    ///////////////////////////
    if (star >= 4 && star < 5 && itemId == itemIdR) {
      return Row(
        children: [
          ...List.generate(
            3,
            (index) => const Icon(Icons.star, color: Colors.yellow, size: 19),
          ),
          Icon(
            Icons.star_outline_sharp,
            size: 19,
          ),
          Icon(
            Icons.star_outline_sharp,
            size: 19,
          ),
        ],
      );
    }
    ///////////////////////////
    if (star >= 5 && itemId == itemIdR) {
      return Row(
        children: [
          ...List.generate(
              4,
              (index) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 19,
                  )),
          Icon(
            Icons.star_outline_sharp,
            size: 19,
          ),
        ],
      );
    } else {
      return Row(
        children: [
          ...List.generate(
              5,
              (index) => const Icon(
                    Icons.star,
                    size: 19,
                  ))
        ],
      );
    }
  }
}
