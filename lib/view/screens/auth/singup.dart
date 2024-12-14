import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rezaqi_ecommerce/controller/auth/singup_controller.dart';
import 'package:rezaqi_ecommerce/core/class/status_request.dart';
import 'package:rezaqi_ecommerce/core/constant/colors.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
import '../../../core/class/plaint.dart';
import '../../../core/funcation/validat.dart';
import '../../widget/button_sing_input.dart';
import '../../widget/custom_text_form.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    SingUpControllerImp signController = Get.put(SingUpControllerImp());

    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    //final double width = size.width;

    return GetBuilder<SingUpControllerImp>(builder: (c) {
      return Scaffold(
          backgroundColor: const Color.fromRGBO(98, 136, 247, 1),
          body: c.statusRequest == StatusRequest.loading
              ? Center(
                  child: Lottie.asset("assets/images/loading.json"),
                )
              : c.statusRequest == StatusRequest.offlineFailure
                  ? Center(
                      child: Lottie.asset("assets/images/offline.json"),
                    )
                  : c.statusRequest == StatusRequest.serverFailure
                      ? Center(
                          child: Lottie.asset("assets/images/error.json"),
                        )
                      : SingleChildScrollView(
                          child: Stack(children: [
                            SizedBox(
                              height: height / 2.7,
                              width: double.infinity,
                              child: Lottie.network(
                                  "https://assets10.lottiefiles.com/packages/lf20_puciaact.json"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height / 3.9),
                              child: CustomPaint(
                                painter: RPSCustomPainter(),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height / 1.7,
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Register",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            "Create your account",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 70,
                                          ),
                                          // ============== Form ======================= //
                                          Expanded(
                                            child: Form(
                                              key: signController.formState,
                                              child: ListView(children: [
                                                CustomTextForm(
                                                  colorForm: AppColor.seCo,
                                                  valid: (val) {
                                                    return validatInput(val!, 3,
                                                        20, 'username');
                                                  },
                                                  showText: false,
                                                  myController:
                                                      signController.username,
                                                  label: 'usernmae',
                                                  hintText:
                                                      "Enter your username",
                                                ),

                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                // ============================== Email ===================== //
                                                CustomTextForm(
                                                  colorForm: AppColor.seCo,
                                                  valid: (val) {
                                                    return validatInput(
                                                        val!, 5, 50, 'email');
                                                  },
                                                  showText: false,
                                                  myController:
                                                      signController.email,
                                                  label: "Email",
                                                  hintText: "Enter your email",
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                // =============== Phone ====================//
                                                CustomTextForm(
                                                  colorForm: AppColor.seCo,
                                                  valid: (val) {
                                                    return validatInput(
                                                        val!, 5, 20, 'phone');
                                                  },
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  showText: false,
                                                  myController:
                                                      signController.phone,
                                                  label: "Phone",
                                                  hintText: "enter your phone",
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                // ===================== Pass =======================//
                                                CustomTextForm(
                                                  colorForm: AppColor.seCo,
                                                  valid: (val) {
                                                    return validatInput(
                                                        val!, 5, 50, 'pass');
                                                  },
                                                  showText: true,
                                                  myController:
                                                      signController.password,
                                                  label: "Password",
                                                  hintText:
                                                      "Enter your password",
                                                ),
                                              ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // ======================== Buttons to signup or go to login ==================== //
                                    ButtonSingInput(
                                      onPress: () {
                                        signController.singUp();
                                      },
                                      color:
                                          const Color.fromRGBO(9, 215, 98, 1),
                                      title: "Sing Up",
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Already have an account ?",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 161, 213, 255)),
                                        ),
                                        const SizedBox(width: 5),
                                        InkWell(
                                          onTap: () {
                                            Get.offNamed(AppRouts.login);
                                          },
                                          child: const Text(
                                            "Log In",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 1, 245, 156)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 40,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ));
    });
  }
}
