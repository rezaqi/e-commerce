import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widget/custom_button.dart';

Future<bool> alirtExitApp() {
  Get.defaultDialog(
      title: "Wrong",
      titleStyle: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      middleText: "Are you sure want exit?",
      middleTextStyle: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
      actions: [
        CustomButton(
            hight: 15,
            ph: 20,
            borderR: 20,
            textColor: Colors.blue,
            color: Colors.white,
            onPress: () {
              exit(0);
            },
            text: "Confirm",
            fontsize: 17,
            fontWeight: FontWeight.bold),
        CustomButton(
            hight: 15,
            ph: 20,
            borderR: 20,
            textColor: Color.fromARGB(255, 243, 33, 33).withOpacity(0.8),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPress: () {
              Get.back();
            },
            text: "Cancel",
            fontsize: 17,
            fontWeight: FontWeight.w600),
      ]);
  return Future<bool>.value(true);
}
