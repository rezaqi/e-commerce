import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/myfavorite_controller.dart';
import 'package:rezaqi_ecommerce/data/model/items_model.dart';
import 'package:rezaqi_ecommerce/data/model/myfavorite_model.dart';
import '../../core/class/handling_data_view.dart';
import '../widget/home/custom_more.dart';
import '../widget/myfavorite_custom.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyfavoriteController());
    return Scaffold(
        body: ListView(children: [
      CustomTitleItems(
        ontap: () {
          Get.back();
        },
        title: "Favorite",
      ),
      GetBuilder<MyfavoriteController>(builder: (controller) {
        return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            cacheExtent: 10,
            padding: const EdgeInsets.all(10),
            itemCount: controller.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: CustomMyfavorite(
                    myfavoriteModel:
                        MyfavoriteModel.fromJson(controller.data[index]),
                    itemsModel: ItemsModel.fromJson(controller.data[index]),
                  ));
            });
      })
    ]));
  }
}
