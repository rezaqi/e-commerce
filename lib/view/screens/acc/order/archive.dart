import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import '../../../../controller/order/order_archive_controller.dart';
import '../../../widget/account/order/arcive_custom.dart';

class Archive extends GetView<OrderArchiveControllerImp> {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderArchiveControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
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
        child: GetBuilder<OrderArchiveControllerImp>(builder: (c) {
          return HandlingDataView(
            statusRequest: c.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CustomOrdersA(
                      orderModel: controller.data[index],
                    )),
          );
        }),
      ),
    );
  }
}
