import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/images.dart';
import '../../../core/constant/routs_name.dart';
import '../../../core/services/services.dart';
import '../../model/onbording_model.dart';

MyServices _myServices = Get.find();
List<OnBordingModel> onBordingList = [
  OnBordingModel(
      image: AppImages.first,
      title: "VISIT OUR \n ONLINE SHOP",
      body:
          "we have millions of-one-kind items so you can found \n whatever you need for you anyone you love",
      button: MaterialButton(
        mouseCursor: MouseCursor.uncontrolled,
        onPressed: () {},
        child: Text(
          "VISIT NOW",
          style: TextStyle(color: Colors.white),
        ),
        color: Color.fromRGBO(11, 43, 99, 1),
      )),
  OnBordingModel(
      button: MaterialButton(
        onPressed: () {},
        child: Text(
          "SEARCH",
          style: TextStyle(color: Colors.white),
        ),
        color: Color.fromRGBO(11, 43, 99, 1),
      ),
      image: AppImages.second,
      title: "CHOOSE WHAT \n YOU WANT",
      body:
          "Buy directly from our sellers who put their heart and soul \n into making someting special"),
  OnBordingModel(
      button: MaterialButton(
        color: const Color.fromRGBO(11, 43, 99, 1),
        onPressed: () {
          _myServices.sharedPre.setString("onbording", "1");
          Get.offAllNamed(AppRouts.auth);
        },
        child: Text(
          "CONTINUE",
          style: TextStyle(color: Colors.white),
        ),
      ),
      image: AppImages.thired,
      title: "PLACE YOUR \n ORDER",
      body:
          "We use the best-in-class technology to prodict any to your \n transaction on our website "),
];
