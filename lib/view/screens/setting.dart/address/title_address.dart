// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rezaqi_ecommerce/controller/appPages/title_address_controller.dart';
// import 'package:rezaqi_ecommerce/view/widget/custom_button.dart';
// import 'package:rezaqi_ecommerce/view/widget/custom_text_form.dart';

// import '../../../../core/funcation/validat.dart';

// class TitleAddress extends StatelessWidget {
//   const TitleAddress({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TitleAddressControllerImp controller = Get.put(TitleAddressControllerImp());
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: Get.height / 2.5,
//           ),
//           CustomTextForm(
//             hintText: "title",
//             myController: controller.title,
//             label: "title",
//             showText: false,
//             valid: (val) {
//               return validatInput(val!, 1, 50, 'title');
//             },
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           CustomTextForm(
//             hintText: "city",
//             myController: controller.city,
//             label: "city",
//             showText: false,
//             valid: (val) {
//               return validatInput(val!, 1, 50, 'title');
//             },
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           CustomTextForm(
//             hintText: "street",
//             myController: controller.street,
//             label: "street",
//             showText: false,
//             valid: (val) {
//               return validatInput(val!, 1, 50, 'title');
//             },
//           ),
//           SizedBox(
//             height: Get.height / 3.2,
//           ),
//           CustomButton(
//               onPress: () {
//                 controller.addAddress();
//               },
//               ph: 10,
//               borderR: 20,
//               textColor: Colors.white,
//               color: Color.fromARGB(255, 62, 234, 151),
//               text: "complete",
//               fontsize: 25,
//               fontWeight: FontWeight.bold)
//         ],
//       ),
//     ));
//   }
// }
