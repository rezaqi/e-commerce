import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routs_name.dart';
import '../../core/class/status_request.dart';
import '../../core/funcation/handling.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login_data.dart';
import '../../data/model/login_model.dart';

abstract class LogInController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.succes;
  LoginModel loginModel = Get.put(LoginModel());
  LogInData loginData = LogInData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  logIn();
  goToSingUp();
}

class LogInControllerImp extends LogInController {
  @override
  goToSingUp() {
    Get.toNamed(AppRouts.singup);
  }

  @override
  logIn() async {
    try {
      if (formState.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var res = await loginData.postData(email.text, password.text);
        statusRequest = handling(res);
        if (statusRequest == StatusRequest.succes) {
          if (res["status"] == 'success') {
            myServices.sharedPre
                .setString("id".toString(), res["data"]['users_id'].toString());
            String userId = myServices.sharedPre.getString("id")!;
            myServices.sharedPre
                .setString("username", res["data"]["users_name"]);
            myServices.sharedPre.setString("email", res["data"]["users_email"]);
            myServices.sharedPre.setString("phone", res["data"]["users_phone"]);
            myServices.sharedPre.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("user");
            FirebaseMessaging.instance.subscribeToTopic("user${userId}");

            Get.offAllNamed(AppRouts.homeScreen);
          } else {
            Get.defaultDialog(
              title: "Waring",
              middleText: "Phone Number Or Email not correct ",
              cancel: InkWell(
                onTap: () => Get.back(),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            );
          }
        }

        update();
      }
    } catch (e) {
      print("========== error $e ");
      return e;
    }
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
