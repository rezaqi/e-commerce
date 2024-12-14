import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rezaqi_ecommerce/controller/order/order_controller.dart';
import 'package:rezaqi_ecommerce/core/constant/colors.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
import 'package:rezaqi_ecommerce/view/screens/cart.dart';

import '../../../data/model/order_model.dart';

class CustomOrders extends GetView<OrderControllerImp> {
  final OrderModel orderModel;
  const CustomOrders({super.key, required this.orderModel});

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
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(right: 20),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.brown[200],
                borderRadius: BorderRadius.horizontal(
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
                      if (orderModel.orderStatus == "0")
                        MaterialButton(
                            onPressed: () {
                              controller.deleteDetils(orderModel.orderId!);
                            },
                            child: const Text("Delete",
                                style: TextStyle(
                                  color: Colors.redAccent,
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
