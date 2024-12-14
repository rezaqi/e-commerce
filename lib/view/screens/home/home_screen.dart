import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/core/constant/colors.dart';
import '../../../controller/home/app_navigator_buttom.dart';
import '../../widget/home/anb.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ANBControllerImp());

    return GetBuilder<ANBControllerImp>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            decoration: BoxDecoration(
                color: AppColor.seCo,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20), bottom: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(controller.listPage.length, (i) {
                  //int index = i > 0 || i > 2 ? i - 2 : i;
                  return
                      // i > 0 && i < 2 || i == 3
                      //     ? const SizedBox(
                      //         width: 20,
                      //       )
                      // :
                      CusstomNavigatorButtom(
                    icon: controller.listButton[i]['icon'],
                    //  title: controller.listButton[i]["title"],
                    active: controller.currentPage == i ? true : false,
                    onPressed: () {
                      controller.goToPage(i);
                    },
                  );
                })
              ],
            ),
          ),
        ),
        body: controller.listPage.elementAt(controller.currentPage),
      );
    });
  }
}
