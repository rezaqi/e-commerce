import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rezaqi_ecommerce/controller/cart/checkout_controller.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
import 'package:rezaqi_ecommerce/view/widget/checkout/chosse_address.dart';
import 'package:rezaqi_ecommerce/view/widget/checkout/payment_method.dart';

import '../../core/constant/colors.dart';

class Checkout extends GetView<CheckoutControllerImp> {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: Get.height / 19,
          alignment: Alignment.bottomRight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: MaterialButton(
              padding: const EdgeInsets.all(5),
              color: Colors.teal,
              onPressed: () {
                controller.ordercheck();
              },
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.tealAccent,
                size: 30,
              ),
            ),
          ),
        ),
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
            elevation: 0,
            title: Text(
              "Chekout",
              style: TextStyle(color: AppColor.preCo),
            ),
            backgroundColor: const Color.fromARGB(0, 255, 255, 255)),
        body: GetBuilder<CheckoutControllerImp>(builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Lottie.asset("assets/images/order.json"),
                Text(
                  "Check payment method",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      controller.chossePaymentMethod("cash");
                    },
                    child: PaymentMethod(
                        text: "Cash",
                        isAc:
                            controller.paymentMethod == "cash" ? true : false)),
                InkWell(
                    onTap: () {
                      controller.chossePaymentMethod("card");
                    },
                    child: PaymentMethod(
                        text: "Payment Cards",
                        isAc:
                            controller.paymentMethod == "card" ? true : false)),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Chosse Address",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (controller.dataAddress.isEmpty)
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRouts.map);
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.add,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add Address",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ...List.generate(
                      controller.dataAddress.length,
                      (i) => InkWell(
                          onTap: () {
                            controller.chosseAddress(
                                controller.dataAddress[i].addressId!);
                          },
                          child: ChosseAddress(
                              text: "${controller.dataAddress[i].addressName}",
                              isAc: controller.idAddress ==
                                      controller.dataAddress[i].addressId!
                                  ? true
                                  : false)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
