import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../controller/order/order_controller.dart';

requestNotificain() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfing() {
  print("======================= message ===============");
  FirebaseMessaging.onMessage.listen((message) {
    print("______________notifacain________________");
    String? title = message.notification!.title;
    String? body = message.notification!.body;
    print(title);
    print(body);
    FlutterRingtonePlayer.playNotification();
    refreshPageOrder(message.data);
    Get.snackbar(title!, body!);
  });
}

refreshPageOrder(data) async {
  print("================= page id ==============");
  print(data['paageid']);
  print("================= page name ==============");
  print(data['pagename']);
  print("-------------------------- current page ---------------");
  print(Get.currentRoute);
  if (Get.currentRoute == "/orderpending" &&
      data['pagename'] == "refreshOrder") {
    OrderControllerImp controller = Get.find();
    controller.refreshOrdre();
  }
}
