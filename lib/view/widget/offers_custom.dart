import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/offers_controller.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/links.dart';

class CustomListOffers extends StatelessWidget {
  const CustomListOffers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImp());
    return Container(
      child: GetBuilder<OffersControllerImp>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 219, 216, 216),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: SizedBox(
                                    height: Get.height / 6,
                                    width: Get.width / 3,
                                    child: Image.network(
                                      "${AppLinks.imageItem}/${controller.data[index].itemsImage}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                controller.data[index].itemsDiscount != '0'
                                    ? Container(
                                        height: 20,
                                        //   margin: const EdgeInsets.only(top: 0),
                                        decoration: const BoxDecoration(
                                            color: Colors.pinkAccent,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10))),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "${controller.data[index].itemsDiscount}%",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    : Container(),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${controller.data[index].itemsName}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                          "\$${controller.data[index].itemsPrice}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black
                                                  .withOpacity(0.7))),
                                      const Positioned(
                                        top: 10,
                                        child: SizedBox(
                                          height: 1,
                                          width: 50,
                                          child: Divider(
                                            color: Colors.black,
                                            indent: 10,
                                            thickness: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                      "${controller.data[index].itemsPriceDiscount}\$",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 2, 177, 92)))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height / 6,
                              width: 50,
                              child: const Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 1,
                                    width: 1,
                                  ),
                                  Positioned(
                                    right: -10,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ]))),
            ));
      }),
    );
  }
}
