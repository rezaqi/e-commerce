import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rezaqi_ecommerce/controller/order/detils_controller.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/links.dart';
import 'package:rezaqi_ecommerce/view/widget/account/order/detils/appbar_detils_custom.dart';

import '../../../widget/account/order/about_order_custom.dart';
import '../../../widget/account/order/detils/address_detils_custom.dart';
import '../../../widget/account/order/detils/order_status_custom.dart';

class Detils extends StatelessWidget {
  const Detils({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetilsControllerImp());
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.brown[200],
        title: const Text("Detils"),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 30, bottom: 10),
          width: Get.width,
          child: GetBuilder<DetilsControllerImp>(builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              // =========================================== list page ============================ //
              widget: ListView(
                children: [
                  // =========================================== items ============================ //
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            controller.data.length,
                            (i) => RowItemDetils(
                                  image:
                                      "${AppLinks.imageItem}/${controller.data[i].itemsImage}",
                                  name: "${controller.data[i].itemsName}",
                                  count: "${controller.data[i].itemsCat}",
                                  price: "${controller.data[i].itemPrice}\$",
                                )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // =========================================== about ============================ //
                  AboutOrder(
                      order: 'Order ${controller.orderModel.orderId}',
                      payment:
                          "${controller.orderPayment(controller.orderModel.orderPayment!)}",
                      discount: "${controller.orderModel.orderDiscount}\%",
                      delivery: "${controller.orderModel.orderDeliveryprice}\$",
                      price: "${controller.orderModel.orderPrice}\$",
                      totalprice: "${controller.orderModel.orderTotalprice}\$"),
                  const SizedBox(
                    height: 10,
                  ),
                  // =========================================== status ============================ //
                  OrderStatus(
                      status:
                          "${controller.orderStatus(controller.orderModel.orderStatus!)}",
                      time: "${controller.orderModel.orderTime}"),
                  const SizedBox(
                    height: 10,
                  ),
                  // =========================================== address ============================ //
                  AddressDetils(
                      city: "${controller.orderModel.addressCity} - ",
                      name: "${controller.orderModel.addressName}",
                      street: "${controller.orderModel.addressStreet}",
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.completerCurrent!.complete(controllermap);
                      },
                      camera: controller.KGooglePiex!,
                      marker: controller.marker.toSet())
                ],
              ),
            );
          })),
    );
  }
}
