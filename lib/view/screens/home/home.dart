import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/cart/cart_controller.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
import 'package:rezaqi_ecommerce/view/widget/home/custom_more.dart';
import 'package:rezaqi_ecommerce/view/widget/home/custom_title.dart';
import 'package:rezaqi_ecommerce/view/widget/home/custom_topsilling.dart';

import '../../../controller/home/home_controller.dart';
import '../../widget/home/custom_categories.dart';
import '../../widget/home/custom_discound.dart';
import '../../widget/home/custom_items.dart';
import '../../widget/home/custom_items_more.dart';
import '../../widget/home/list_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    CartControllerImp cartController = Get.put(CartControllerImp());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRouts.cart);
            cartController.refreshPage();
          },
          child: const Icon(Icons.category),
        ),
        body: WillPopScope(
            child: GetBuilder<HomeControllerImp>(builder: (controller) {
          print(controller.statusRequest);
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTitle(
                        title: "Discover",
                        ontapMyfavorite: () {
                          Get.toNamed(AppRouts.myfavorite);
                        },
                        ontapNotification: () {
                          Get.toNamed(AppRouts.notification);
                        },
                      ),
                      controller.isSearch
                          ? CustomListSearch(
                              listSearch: controller.dataSearch,
                            )
                          : Column(
                              children: [
                                const CustomDiscound(),
                                const SizedBox(
                                  height: 20,
                                ),
                                const CustomCategories(),
                                if (controller.topSillig.isNotEmpty)
                                  CustomTitleItems(
                                      ontap: () {}, title: 'Top Selling'),
                                const SizedBox(height: 10),
                                if (controller.topSillig.isNotEmpty)
                                  const CustomTopSIlling(),
                                CustomTitleItems(
                                    ontap: () {}, title: 'Products for you'),
                                const SizedBox(height: 10),
                                const CustomItems(),
                                // ====================================== More =============================== //
                                CustomTitleItems(ontap: () {}, title: 'More'),
                                const SizedBox(height: 10),
                                const CustomItemsMore(),
                              ],
                            )
                    ],
                  ),
                ),
              ));
        }), onWillPop: () {
          Get.defaultDialog(
              title: "Woring",
              middleText: "Do you wanna exsit from app",
              middleTextStyle:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              cancelTextColor: Colors.red,
              confirmTextColor: Colors.blue,
              buttonColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0),
              onCancel: () {},
              onConfirm: () {
                exit(0);
              });
          return Future.value(false);
        }));
  }
}
