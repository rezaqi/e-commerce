import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rezaqi_ecommerce/core/class/status_request.dart';

import '../constant/images.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImages.loading),
          )
        : statusRequest == StatusRequest.empty
            ? Center(
                child: Column(
                  children: [
                    Lottie.asset("assets/images/empty.json"),
                  ],
                ),
              )
            : statusRequest == StatusRequest.offlineFailure
                ? Center(
                    child: Lottie.asset(AppImages.offline),
                  )
                : statusRequest == StatusRequest.serverFailure
                    ? Center(
                        child: Lottie.asset(AppImages.error),
                      )
                    : statusRequest == StatusRequest.serverExpection
                        ? Center(child: Lottie.asset(AppImages.error))
                        : widget;
  }
}
