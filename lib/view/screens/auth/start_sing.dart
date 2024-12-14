import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/auth/singup_controller.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/funcation/alirt_exit_app.dart';
import '../../widget/button_sing_input.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    LogInControllerImp logController = Get.put(LogInControllerImp());
    SingUpControllerImp singController = Get.put(SingUpControllerImp());
    return Scaffold(
        body: WillPopScope(
      onWillPop: alirtExitApp,
      child: SingleChildScrollView(
        child: Container(
            height: height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: height / 5,
                    width: width / 2.709,
                    child: Image.asset("assets/images/r.png")),
                const SizedBox(
                  height: 20,
                ),
                const Text("Rezqi Adib",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 32, 43, 108))),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // sing up
                    ButtonSingInput(
                      onPress: () {
                        logController.goToSingUp();
                      },
                      color: Color.fromARGB(255, 11, 194, 17),
                      title: "Sing Up",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // log in
                    ButtonSingInput(
                      onPress: () {
                        singController.goToLogIn();
                      },
                      color: Colors.indigo,
                      title: "Log In",
                    ),
                  ],
                )
              ],
            )),
      ),
    ));
  }
}
