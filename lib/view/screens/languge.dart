import 'package:flutter/material.dart';
import 'package:rezaqi_ecommerce/main.dart';
import 'package:get/get.dart';
import '../../core/localization/change_local.dart';

class Languge extends GetView<LocaleController> {
  const Languge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello".tr),
            SizedBox(height: 40),
            MaterialButton(
              onPressed: () {
                controller.ChangeLang("en");
              },
              child: Text("English"),
            ),
            SizedBox(height: 20),
            MaterialButton(
              //color: Color.fromARGB(255, 37, 116, 242),
              onPressed: () {
                controller.ChangeLang("ar");
              },
              child: Text("عربى"),
            ),
          ],
        ),
      ),
    );
  }
}
