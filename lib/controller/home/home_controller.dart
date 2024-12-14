import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routs_name.dart';
import '../../core/funcation/handling.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/home_data.dart';
import '../../data/model/items_model.dart';
import '../appPages/search_conntroller.dart';

abstract class HomeController extends SearchMaxController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  String? lang;
  String? id;
  String? username;
  String? email;
  String? phone;
  String deliveryTime = '';
  String? title;
  String? body;

  List categories = [];
  List items = [];
  List topSillig = [];
  List sittings = [];

  initailData();
  getData();
  goToProduct(ItemsModel itemsModel);
  goToItem(
    List categories,
    int selected,
    String catId,
  );
}

class HomeControllerImp extends HomeController {
  @override
  void onInit() {
    getData();
    initailData();
    super.onInit();
  }

  @override
  initailData() {
    lang = myServices.sharedPre.getString("lang");
    id = myServices.sharedPre.getString("id").toString();
    username = myServices.sharedPre.getString("username");
    email = myServices.sharedPre.getString("email");
    phone = myServices.sharedPre.getString("phone");
    // ftm.getToken().then((token) {
    //   print("_____________________");
    //   print(token);
    //   print("######################");
    // });
  }

  @override
  getData() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var res = await homeData.getData();
      statusRequest = handling(res);

      if (statusRequest == StatusRequest.succes) {
        if (res["status"] == ('success')) {
          categories.addAll(res['categories']["data"]);
          items.addAll(res["items"]["data"]);
          if (res["topsilling"]["status"] == 'success') {
            topSillig.addAll(res["topsilling"]["data"]);
            print("000000000000000000000000");
            print(topSillig);
            print("000000000000000000000000");
          }

          sittings.addAll(res['sittings']['data']);
          title = sittings[0]["sittings_title"];
          body = sittings[0]["sittings_body"];
          deliveryTime = sittings[0]['sittings_deliverytime'];
          deliveryTime = myServices.sharedPre
              .setString("deliverytime", deliveryTime)
              .toString();
        } else {
          statusRequest = StatusRequest.empty;
        }
      }
    } catch (e) {
      print(e);
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  goToItem(categories, selected, catId) {
    Get.toNamed(AppRouts.items, arguments: {
      "categories": categories,
      "selected": selected,
      'categories_id': catId,
    });
  }

  @override
  goToProduct(itemsModel) {
    Get.toNamed(AppRouts.product, arguments: {"itemsModel": itemsModel});
  }
}
