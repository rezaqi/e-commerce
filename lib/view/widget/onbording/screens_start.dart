import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/onbording_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../data/datasource/static/static.dart';

class StartScreenOnBording extends GetView<OnBordingControllerImp> {
  const StartScreenOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    Get.put(OnBordingControllerImp());
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onChanged(val);
      },
      itemCount: onBordingList.length,
      itemBuilder: (context, i) => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              AppColor.seCo,
              AppColor.preCo,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: h / 2, child: Image.asset(onBordingList[i].image!)),
            const SizedBox(
              height: 30,
            ),

// ===================================== title =============================== //

            Container(
                width: w,
                alignment: Alignment.center,
                child: Text(onBordingList[i].title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge)),
            const SizedBox(
              height: 20,
            ),

// ===================================== Body =============================== //

            Text(onBordingList[i].body!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(
              height: 20,
            ),

// ===================================== Button =============================== //

            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: h / 20,
                width: w / 2,
                child: onBordingList[i].button,
              ),
            )
          ],
        ),
      ),
    );
  }
}
