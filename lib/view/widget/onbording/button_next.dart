import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rezaqi_ecommerce/controller/onbording_controller.dart';

import '../../../core/constant/colors.dart';

class ButtonNextOnBording extends GetView<OnBordingControllerImp> {
  const ButtonNextOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControllerImp>(
      builder: (controller) => TextButton(
          onPressed: () {
            controller.next();
          },
          child: Text(
            "Next",
            style: TextStyle(
              color: AppColor.white,
            ),
          )),
    );
  }
}
