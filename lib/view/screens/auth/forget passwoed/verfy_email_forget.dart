import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerfyEmailForget extends StatefulWidget {
  const VerfyEmailForget({super.key});

  @override
  State<VerfyEmailForget> createState() => _VerfyEmailForgetState();
}

class _VerfyEmailForgetState extends State<VerfyEmailForget> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double h = size.height;
    final double w = size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cleaning_services),
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
          SizedBox(
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
              onChanged: (pin) {
                print("Changed: " + pin);
              },
              onCompleted: (pin) {
                print("Completed: " + pin);
              }),
        ],
      ),
    );
  }
}
