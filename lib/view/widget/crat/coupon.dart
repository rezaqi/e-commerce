import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/cart/cart_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/funcation/validat.dart';
import '../custom_button.dart';
import '../custom_text_form.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());

    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Row(
        children: [
          controller.couponName == null
              ? Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(colors: [
                              AppColor.seCo.withRed(255),
                              AppColor.preCo,
                            ])),
                        height: 90,
                        width: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Enter here your coupon for take discount"),
                            CustomTextForm(
                                hintText: "Coupon",
                                myController: controller.cText,
                                label: "Coupon",
                                showText: false,
                                valid: (val) {
                                  return validatInput(
                                      "", 4, 10, AutofillHints.addressCity);
                                },
                                colorForm: Colors.transparent),
                          ],
                        ),
                      ),
                      CustomButton(
                          hight: 90,
                          ph: 2,
                          borderR: 20,
                          textColor: Colors.white,
                          color: AppColor.preCo,
                          onPress: () {
                            controller.checkCoupon();
                          },
                          text: "check",
                          fontsize: 20,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                )
              : Stack(
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: Get.width,
                        color: Colors.white),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.pinkAccent,
                        Colors.yellow,
                        AppColor.seCo,
                      ])),
                    ),
                    Positioned(
                      right: 85,
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 25,
                        width: 25,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 85,
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 25,
                        width: 25,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${controller.couponName}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${controller.couponDiscount}\%",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    )
                  ],
                ),
        ],
      );
    });
  }
}
