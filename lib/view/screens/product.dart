import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/product_controller.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';

import '../../core/constant/colors.dart';
import '../widget/items/products/bottomNavigationBar.dart';
import '../widget/items/products/image_product.dart';
import '../widget/items/products/list_color.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsControllerImp controller = Get.put(ProductsControllerImp());
    return Scaffold(
      bottomNavigationBar: const CustomBNBProduct(),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const CustomImageProduct(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.itemsModel.itemsName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: AppColor.preCo),
                                ),
                                controller.itemsModel.itemsDiscount != "0"
                                    ? Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                              top: 1,
                                              right: 1,
                                              child: Container(
                                                child: Text(
                                                    "\$${controller.itemsModel.itemsPrice}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black
                                                            .withOpacity(0.7))),
                                              ),
                                            ),
                                            const Positioned(
                                              top: 12,
                                              right: 1,
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
                                            Positioned(
                                              bottom: 1,
                                              left: 10,
                                              child: Text(
                                                  "\$${controller.itemsModel.itemsPriceDiscount}",
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.teal)),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        alignment: Alignment.center,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "\$${controller.itemsModel.itemsPrice}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  color: const Color.fromARGB(
                                                      255, 29, 218, 161)),
                                        ),
                                      )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GetBuilder<ProductsControllerImp>(
                              builder: (controller) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.add();
                                    },
                                    child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 184, 183, 183),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(Icons.add)),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 184, 183, 183),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "${controller.coutItem} ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.remove();
                                    },
                                    child: Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 12),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 184, 183, 183),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(Icons.minimize)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.only(top: 10, right: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                             const     Text(
                                    "Delivery Time :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${controller.deliveryTime} days",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    const  SizedBox(
                                        width: 10,
                                      ),
                                  const    Icon(Icons.timer, color: Colors.white)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Color",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Colors.black.withOpacity(0.6)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const CustomListColor(),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              """hidhidhd dididd dh dihdihd d hidihdd hhihihi dihididhi
hidihdd hhihihi dihididhi
hdihdididiidid djdojjdd
dododojdoo fhihifhfi ididhihid ddgg""",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
