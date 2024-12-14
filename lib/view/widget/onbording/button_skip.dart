import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/onbording_controller.dart';

import '../../../core/constant/colors.dart';

class ButtonSkipOnBording extends GetView<OnBordingControllerImp> {
  const ButtonSkipOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        "Skip",
        style: TextStyle(
          color: AppColor.white,
        ),
      ),
      onPressed: () {
        controller.skip();
      },
    );
  }
}
