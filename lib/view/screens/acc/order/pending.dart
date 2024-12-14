import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/order/order_controller.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/data/model/order_model.dart';

import '../../../widget/account/list_orders.dart';

class OrderPending extends GetView<OrderControllerImp> {
  const OrderPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "My order",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        child: GetBuilder<OrderControllerImp>(builder: (c) {
          return HandlingDataView(
            statusRequest: c.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CustomOrders(
                      orderModel: controller.data[index],
                    )),
          );
        }),
      ),
    );
  }
}
