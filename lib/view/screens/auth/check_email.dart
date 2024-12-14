import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:rezaqi_ecommerce/controller/auth/singup_controller.dart';
import 'package:rezaqi_ecommerce/core/class/status_request.dart';
import '../../../core/constant/routs_name.dart';
import '../../widget/custom_button.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({super.key});

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    // final double h = size.height;
    // final double w = size.width;
    Get.put(SingUpControllerImp);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cleaning_services),
        onPressed: () {
          print("Floating button was pressed.");
          otpController.clear();
          otpController.set(["", "", "", "", ""]);
          otpController.setValue('', 0);
          otpController.setFocus(0);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Check your email and enter \n here 5 numbers ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.indigo),
          ),
          const SizedBox(
            height: 40,
          ),
          OTPTextField(
              controller: otpController,
              length: 5,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15,
              style: const TextStyle(fontSize: 17),
              onChanged: (pin) {},
              onCompleted: (pin) {}),
          const SizedBox(
            height: 80,
          ),
          CustomButton(
              hight: 15,
              ph: 20,
              borderR: 20,
              textColor: Colors.black,
              color: Colors.blue,
              onPress: () {
                Get.toNamed(AppRouts.succesSingUp);
              },
              text: "Check",
              fontsize: 20,
              fontWeight: FontWeight.bold)
        ],
      ),
    );
  }
}
