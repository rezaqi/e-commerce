import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rezaqi_ecommerce/controller/auth/login_controller.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/core/class/status_request.dart';
import 'package:rezaqi_ecommerce/core/funcation/alirt_exit_app.dart';
import 'package:rezaqi_ecommerce/view/screens/auth/forget%20passwoed/verfy_email_forget.dart';
import '../../../core/class/plaint.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/routs_name.dart';
import '../../../core/funcation/validat.dart';
import '../../widget/button_sing_input.dart';
import '../../widget/custom_text_form.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());

    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    //final width = size.width;

    return Scaffold(
        backgroundColor: const Color.fromRGBO(98, 136, 247, 1),
        body: GetBuilder<LogInControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: alirtExitApp,
              child: SingleChildScrollView(
                child: Stack(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Lottie.network(
                      "https://assets1.lottiefiles.com/packages/lf20_q6wsiidu.json"),
                  Padding(
                    padding: EdgeInsets.only(top: height / 3.5),
                    child: CustomPaint(
                      painter: RPSCustomPainter(),
                      child: Column(
                        children: [
                          Container(
                            height: height / 1.86,
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "LogIn to your account",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                Expanded(
                                    child: Form(
                                  key: controller.formState,
                                  child: ListView(children: [
                                    CustomTextForm(
                                      colorForm: AppColor.seCo,
                                      valid: (val) {
                                        return validatInput(
                                            val!, 5, 50, 'email');
                                      },
                                      showText: false,
                                      myController: controller.email,
                                      hintText: "Enter your email",
                                      label: 'Email',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextForm(
                                      colorForm: AppColor.seCo,
                                      valid: (val) {
                                        return validatInput(
                                            val!, 5, 20, 'pass');
                                      },
                                      showText: true,
                                      myController: controller.password,
                                      label: "Password",
                                      hintText: "Enter your password",
                                    ),
                                  ]),
                                )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 15, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(VerfyEmailForget());
                                        },
                                        child: const Text(
                                          "Forgot Password ?",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          ButtonSingInput(
                            color: const Color.fromRGBO(2, 32, 120, 1),
                            title: "Log In",
                            onPress: () {
                              controller.logIn();
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 161, 213, 255)),
                              ),
                              const SizedBox(width: 5),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRouts.singup);
                                },
                                child: const Text(
                                  "Sing Up",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 1, 245, 156)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 9,
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          );
        }));
  }
}
