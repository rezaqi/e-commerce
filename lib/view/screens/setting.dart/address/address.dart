import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/view/widget/address/list_address.dart';
import '../../../../controller/sitting/address/view_address_controller.dart';
import '../../../../core/constant/routs_name.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressViewControllerImp());
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "My Address",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: Colors.white10,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.toNamed(AppRouts.map);
            },
            label: const Icon(Icons.add)),
        body: GetBuilder<ViewAddressViewControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, i) => CustomListAddress(
                          name: "${controller.data[i].addressName}",
                          city: "${controller.data[i].addressCity}",
                          street: "${controller.data[i].addressStreet}",
                          ontap: () {
                            controller
                                .deleteDataA(controller.data[i].addressId!);
                          },
                        )),
              ],
            ),
          );
        }));
  }
}
