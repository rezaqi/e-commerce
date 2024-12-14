import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';

import '../../widget/account/list_page_custpm.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 224, 224),
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 225, 224, 224),
          title: const Text(
            "My account",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            margin: const EdgeInsets.only(top: 150),
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset("assets/images/r.png",
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 40,
                ),
                ListPageCustom(
                    ontap: () {
                      Get.toNamed(AppRouts.orderPending);
                    },
                    title: "My orders",
                    color: const Color.fromARGB(255, 198, 242, 232),
                    textColor: const Color.fromARGB(215, 65, 65, 65),
                    icon: Icons.shopping_cart_checkout_rounded),
                const SizedBox(
                  height: 10,
                ),
                ListPageCustom(
                    ontap: () {
                      Get.toNamed(AppRouts.archive);
                    },
                    title: "Archive",
                    color: const Color.fromARGB(255, 198, 242, 232),
                    textColor: const Color.fromARGB(215, 65, 65, 65),
                    icon: Icons.archive_outlined),
              ],
            ),
          ),
        ));
  }
}
