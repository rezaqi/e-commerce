import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/cart/cart_controller.dart';
import '../../../core/constant/colors.dart';

class CustomCartTitlePage extends StatelessWidget {
  // final dynamic controller;
  const CustomCartTitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp c = Get.put(CartControllerImp());
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          InkWell(
              onTap: () async {
                await c.refreshPage();
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
          SizedBox(
            width: Get.width / 3.2,
          ),
          Text(
            "Cart",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColor.preCo),
          ),
        ],
      ),
    );
  }
}
