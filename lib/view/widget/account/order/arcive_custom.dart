import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rezaqi_ecommerce/controller/order/order_archive_controller.dart';
import 'package:rezaqi_ecommerce/view/widget/account/order/archive_rating.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/routs_name.dart';
import '../../../../data/model/order_model.dart';

class CustomOrdersA extends GetView<OrderArchiveControllerImp> {
  final OrderModel orderModel;
  const CustomOrdersA({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        color: Colors.brown[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.only(right: 20),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.brown[200],
                borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(20), left: Radius.circular(5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    " Order Number :  ${orderModel.orderId}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(Jiffy.parse("${orderModel.orderTime}").fromNow(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.buttonCo))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Payment Mathoud :  ${controller.orderPayment(orderModel.orderPayment!)}",
                      style: const TextStyle(fontSize: 20)),
                  Text("Delivery price :  ${orderModel.orderDeliveryprice}\$",
                      style: const TextStyle(fontSize: 20)),
                  Text("Price :  ${orderModel.orderPrice}\$",
                      style: const TextStyle(fontSize: 20)),
                  Text("Discount :  ${orderModel.orderDiscount}\%",
                      style: const TextStyle(fontSize: 20)),
                  Text(
                      "status :  ${controller.orderStatus(orderModel.orderStatus!)}",
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(
                      height: 10,
                      child: Divider(
                        indent: 20,
                        thickness: 1,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total price :  ${orderModel.orderTotalprice}\$",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (orderModel.orderRating == "0")
                        MaterialButton(
                            onPressed: () {
                              showDialogRating(context, orderModel.orderId!,
                                  orderModel.orderComment);
                              //   controller.deleteDetils(orderModel.orderId!);
                            },
                            child: Text("Rating",
                                style: TextStyle(
                                  color: AppColor.seCo,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: MaterialButton(
                            color: Colors.red[200],
                            onPressed: () {
                              Get.toNamed(AppRouts.detils,
                                  arguments: {"ordermodel": orderModel});
                            },
                            child: const Text("Details",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
