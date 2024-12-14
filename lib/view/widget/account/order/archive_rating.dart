import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:rezaqi_ecommerce/controller/order/order_archive_controller.dart';

void showDialogRating(
    BuildContext context, String orderId, String? orderComment) {
  // show the dialog
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: Text(
              'Rating Dialog',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message: Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: const FlutterLogo(size: 100),
            submitButtonText: 'Submit',
            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) async {
              OrderArchiveControllerImp controller = Get.find();
              await controller.aadRatng(
                  orderId, response.rating, response.comment);
              print('rating: ${response.rating}, comment: ${response.comment}');
            },
          ));
}
