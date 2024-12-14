import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routs_name.dart';
import '../../core/class/status_request.dart';
import '../../core/funcation/handling.dart';
import '../../data/datasource/remote/auth/signup_data.dart';

abstract class SingUpController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController username = TextEditingController();
  late TextEditingController phone = TextEditingController();

  SignUpData singupData = SignUpData(Get.find());
  StatusRequest? statusRequest;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  singUp();
  goToLogIn();
}

class SingUpControllerImp extends SingUpController {
  // ====================== Go TO LOGIN ================== //
  @override
  goToLogIn() {
    Get.toNamed(AppRouts.login);
  }

//======================== SING UP DATA ===================================
  @override
  singUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await singupData.postData(
          username.text, email.text, phone.text, password.text);
      statusRequest = handling(res);
      if (statusRequest == StatusRequest.succes) {
        if (res["status"] == 'success') {
          Get.offNamed(AppRouts.succesSingUp);
        } else {
          statusRequest = StatusRequest.empty;
          Get.defaultDialog(
            title: "Waring",
            middleText: "Phone Number Or Email Already Exists ",
            confirm: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () => Get.offNamed(AppRouts.login),
                child: const Text(
                  "LogIn",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
            cancel: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () => Get.back(),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ),
          );
        }
      }

      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
