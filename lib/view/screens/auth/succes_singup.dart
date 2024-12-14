import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
import '../../../controller/auth/succes_singup_controller.dart';
import '../../widget/custom_button.dart';

class SuccesSingUp extends StatelessWidget {
  const SuccesSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: Lottie.network(
              "https://assets1.lottiefiles.com/packages/lf20_aao5ezov.json"),
        ),
        Container(
          alignment: Alignment.topCenter,
          child: Lottie.network(
              "https://assets6.lottiefiles.com/packages/lf20_ya7ssbm3.json"),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 220),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Succes Sgin Up",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 450,
              ),
              CustomButton(
                hight: 15,
                ph: 20,
                borderR: 20,
                color: Colors.black,
                textColor: Colors.greenAccent,
                onPress: () {
                  Get.offAllNamed(AppRouts.login);
                },
                text: "Go to log in",
                fontsize: 25,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
