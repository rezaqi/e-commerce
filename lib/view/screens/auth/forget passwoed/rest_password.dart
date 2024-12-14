import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/auth/login_controller.dart';
import 'package:rezaqi_ecommerce/core/funcation/validat.dart';

import '../../../../core/constant/colors.dart';
import '../../../widget/button_sing_input.dart';
import '../../../widget/custom_text_form.dart';

class RestPassword extends StatelessWidget {
  const RestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    LogInControllerImp controller = Get.put(LogInControllerImp());

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(98, 136, 247, 1),
        body: SingleChildScrollView(
          child: Stack(children: [
            const SizedBox(
              height: 15,
            ),

            // Lottie.network(
            //     "https://assets1.lottiefiles.com/packages/lf20_q6wsiidu.json"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height / 1.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "New Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "enter your new password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      CustomTextForm(
                        colorForm: AppColor.seCo,
                        valid: (val) {
                          return validatInput(val!, 5, 20, 'pass');
                        },
                        showText: false,
                        myController: controller.email,
                        hintText: "Enter your password",
                        label: 'New Password',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextForm(
                        colorForm: AppColor.seCo,
                        valid: (val) {
                          return validatInput(val!, 5, 20, 'pass');
                        },
                        showText: true,
                        myController: controller.password,
                        label: "return password",
                        hintText: "Enter your same password",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonSingInput(
                  color: Color.fromRGBO(1, 103, 105, 1),
                  title: "Update",
                  onPress: () {},
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: height / 9,
                )
              ],
            )
          ]),
        ));
  }
}
