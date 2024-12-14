import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/product_controller.dart';
import 'package:rezaqi_ecommerce/core/constant/colors.dart';
import 'package:rezaqi_ecommerce/links.dart';

class CustomImageProduct extends GetView<ProductsControllerImp> {
  const CustomImageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2.6,
      decoration: BoxDecoration(
          color: AppColor.seCo,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20))),
      width: Get.width,
      child: Stack(
        children: [
          Container(
            height: Get.height / 2.6,
            width: Get.width,
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                child: Hero(
                  tag: "${controller.itemsModel.itemsId}",
                  child: Image.network(
                    "${AppLinks.imageItem}/${controller.itemsModel.itemsImage}",
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
