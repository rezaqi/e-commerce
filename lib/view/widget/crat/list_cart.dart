import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/cart/cart_controller.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/links.dart';

class CustomListCart extends StatelessWidget {
  const CustomListCart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Container(
      //  color: Colors.amber,
      // height: Get.height,
      // width: Get.width,
      child: GetBuilder<CartControllerImp>(builder: (cartController) {
        return HandlingDataView(
            statusRequest: cartController.statusRequest,
            widget: Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: cartController.data.length,
                  itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 219, 216, 216),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: SizedBox(
                                  height: Get.height / 6,
                                  child: Image.network(
                                    "${AppLinks.imageItem}/${cartController.data[index].itemsImage}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topCenter,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${cartController.data[index].itemsName}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                        "${cartController.data[index].itemPrice}\$",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 2, 177, 92)))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () async {
                                    cartController.addCart(cartController
                                        .data[index].itemsId
                                        .toString());
                                    cartController.refreshPage();
                                  },
                                  child: const Icon(Icons.add),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "${cartController.data[index].itemSelect}"),
                                InkWell(
                                  onTap: () async {
                                    await cartController.deleteCart(
                                        cartController.data[index].itemsId
                                            .toString());
                                    cartController.refreshPage();
                                  },
                                  child: const Icon(Icons.minimize),
                                )
                              ],
                            ))
                          ],
                        )
                      ]))),
            ));
      }),
    );
  }
}
