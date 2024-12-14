import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/favorite_controller.dart';
import 'package:rezaqi_ecommerce/controller/home/home_controller.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/data/model/rating_model.dart';
import '../../controller/appPages/item._controller.dart';
import '../../core/constant/routs_name.dart';
import '../../data/model/items_model.dart';
import '../widget/home/custom_items_categries.dart';
import '../widget/home/list_search.dart';
import '../widget/items/items.dart';
import '../widget/items/title_custm.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({
    super.key,
  });

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    Get.put(HomeControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<ItemControllerImp>(
        builder: (controller) => Scaffold(
                body: HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitlee(
                    title: "Discover",
                    ontapMyfavorite: () {
                      Get.toNamed(AppRouts.myfavorite);
                    },
                    ontapNotification: () {},
                  ),
                  controller.isSearch
                      ? CustomListSearch(
                          listSearch: controller.dataSearch,
                        )
                      : Expanded(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: CustomItemsCategories(),
                              ),
                              Expanded(
                                child: ListView(
                                  children: [
                                    GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        cacheExtent: 10,
                                        padding: const EdgeInsets.all(10),
                                        itemCount: controller.data.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10,
                                                crossAxisCount: 2),
                                        itemBuilder: (context, index) {
                                          controllerFav.isFav[controller
                                                  .data[index]["items_id"]
                                                  .toString()] =
                                              controller.data[index]["favorite"]
                                                  .toString();
                                          print(controllerFav.isFav);
                                          return HandlingDataView(
                                              statusRequest:
                                                  controller.statusRequest,
                                              widget: CustomListItems(
                                                  // ratingModel: controller
                                                  //     .dataRating[index],
                                                  itemsModel:
                                                      ItemsModel.fromJson(
                                                          controller
                                                              .data[index])));
                                        })
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                ],
              ),
            )));
  }
}
