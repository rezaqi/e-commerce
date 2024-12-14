import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/product_controller.dart';

import '../../../../core/constant/colors.dart';

class CustomListColor extends GetView<ProductsControllerImp> {
  const CustomListColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subTitle.length,
          (index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: controller.subTitle[index]["active"] == true
                  ? Border.all(width: 2, color: AppColor.seCo)
                  : null,
            ),
            height: controller.subTitle[index]["active"] == true ? 30 : 32,
            width: controller.subTitle[index]["active"] == true ? 30 : 32,
            child: CircleAvatar(
              backgroundColor: controller.subTitle[index]["color"],
            ),
          ),
        )
      ],
    );
  }
}
