import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rezaqi_ecommerce/core/class/handling_data_view.dart';
import 'package:rezaqi_ecommerce/core/constant/colors.dart';

import '../../controller/appPages/notification_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificaionControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Notification",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColor.preCo),
            ),
            GetBuilder<NotificaionControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Expanded(
                      child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, i) => ListTile(
                          title: Text(
                            "${controller.data[i]['notification_title']}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "${controller.data[i]['notification_body']}",
                          ),
                          trailing: Text(Jiffy.parse(
                                  "${controller.data[i]['notification_time']}")
                              .fromNow()),
                        ),
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
