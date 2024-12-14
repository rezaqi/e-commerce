import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/core/constant/colors.dart';
import '../../../controller/cart/cart_controller.dart';
import '../custom_button.dart';

class CustomListAndButtom extends StatelessWidget {
  const CustomListAndButtom({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return SizedBox(
        //height: Get.height / 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Count items',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${controller.totalCountItems}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColor.seCo),
                )
              ],
            ),
            SizedBox(
              width: Get.width / 1.2,
              child: const Divider(
                height: 0.5,
                thickness: 0.1,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Total price',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${controller.totalPriceItems} \$',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColor.seCo),
                )
              ],
            ),
            SizedBox(
              width: Get.width / 1.2,
              child: const Divider(
                height: 0.5,
                thickness: 0.1,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Discount',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${controller.couponDiscount}\%',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColor.seCo),
                )
              ],
            ),
            SizedBox(
              width: Get.width / 1.2,
              child: const Divider(
                height: 0.5,
                thickness: 0.1,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Total price',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColor.preCo),
                ),
                Text(
                  '${controller.getTotalPrice()} \$',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Color.fromARGB(255, 0, 208, 146)),
                )
              ],
            ),
            CustomButton(
                hight: 15,
                ph: 10,
                borderR: 20,
                textColor: Colors.white,
                color: const Color.fromARGB(255, 2, 173, 156),
                onPress: () {
                  controller.goToCheckout();
                },
                text: "Order",
                fontsize: 20,
                fontWeight: FontWeight.bold)
          ],
        ),
      );
    });
  }
}
