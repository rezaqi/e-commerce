import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rezaqi_ecommerce/controller/auth/forget/forget_password_contro;;er.dart';
import 'package:rezaqi_ecommerce/controller/auth/login_controller.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/funcation/validat.dart';
import '../../../widget/button_sing_input.dart';
import '../../../widget/custom_text_form.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
// controllers
    LogInControllerImp logController = LogInControllerImp();
    ForgetPasswordControllerImp forgetController =
        ForgetPasswordControllerImp();

// siize screen
    final Size size = MediaQuery.of(context).size;
    final double h = size.height;

    // screen
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: h,
                alignment: Alignment.bottomCenter,
                child: Lottie.network(
                    "https://assets4.lottiefiles.com/packages/lf20_mbginykv.json"),
              ),
              Container(
                height: h,
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Forget Password",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Enter your Email to send you verificain code in  your email",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    CustomTextForm(
                      colorForm: AppColor.seCo,
                      valid: (val) {
                        return validatInput(val!, 5, 20, 'email');
                      },
                      hintText: "enter your email",
                      label: "email",
                      myController: logController.email,
                      showText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonSingInput(
                      color: Colors.greenAccent,
                      onPress: () {
                        forgetController.goToVerfyForget();
                      },
                      title: "Check",
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
