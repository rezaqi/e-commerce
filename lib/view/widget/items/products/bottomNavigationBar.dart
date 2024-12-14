// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/cart/cart_controller.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
import '../../../../core/constant/colors.dart';

class CustomBNBProduct extends StatelessWidget {
  const CustomBNBProduct({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp controller = Get.put(CartControllerImp());
    return InkWell(
      onTap: () {
        Get.toNamed(AppRouts.cart);
        controller.refreshPage();
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20,
          left: Get.width / 8,
          right: Get.width / 8,
        ),
        decoration: BoxDecoration(
            color: AppColor.preCo,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        alignment: Alignment.center,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.white,
              size: 35,
            ),
            const Text(
              "+ Add to car",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
