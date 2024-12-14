import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rezaqi_ecommerce/controller/onbording_controller.dart';
import 'package:rezaqi_ecommerce/view/widget/onbording/button_next.dart';
import 'package:rezaqi_ecommerce/view/widget/onbording/button_skip.dart';
import '../../core/funcation/alirt_exit_app.dart';
import '../widget/onbording/dots_controller.dart';
import '../widget/onbording/screens_start.dart';

class OnBording extends StatelessWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp);
//start Scaffold  -----
    return const Scaffold(
      backgroundColor: Color.fromRGBO(109, 142, 239, 1),
      body: WillPopScope(
        onWillPop: alirtExitApp,
        child: SafeArea(
          child: Column(
            children: [
              // page view ----
              Expanded(flex: 13, child: StartScreenOnBording()),
              SizedBox(
                height: 20,
              ),
              // Dots controller and buttons ---
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonSkipOnBording(),
                    SizedBox(
                      width: 20,
                    ),
                    DotsController(),
                    SizedBox(
                      width: 20,
                    ),
                    ButtonNextOnBording()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
