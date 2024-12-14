import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/onbording_controller.dart';

import '../../../core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';

class DotsController extends StatelessWidget {
  const DotsController({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp);
    return GetBuilder<OnBordingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              onBordingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.linear,
                    height: 6,
                    width: controller.currentPage == index ? 20 : 6,
                    decoration: BoxDecoration(
                        color: controller.currentPage == index
                            ? AppColor.dotMain
                            : AppColor.dot.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
