import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/product_controller.dart';

import '../../../../controller/appPages/item._controller.dart';
import '../../../../core/constant/colors.dart';

class CustomPhotoProduct extends StatelessWidget {
  const CustomPhotoProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsControllerImp controller = Get.put(ProductsControllerImp());
    return Container(
      decoration: BoxDecoration(
          color: AppColor.seCo,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20))),
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Hero(
                tag: "${controller.itemsModel.itemsId}",
                child: Image.network(
                  "${controller.itemsModel.itemsImage}",
                  fit: BoxFit.cover,
                ),
              )),
        ],
      ),
    );
  }
}
