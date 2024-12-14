import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/sitting/address/sitting_controller.dart';
import 'package:rezaqi_ecommerce/core/constant/routs_name.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SittingControllerImp controller = Get.put(SittingControllerImp());
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              trailing: Switch(
                  value: true,
                  onChanged: (value) {
                    value = false;
                  }),
              title: Text(
                "display notification",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Color.fromARGB(215, 65, 65, 65)),
              ),
              leading: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text(
                "languge",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Color.fromARGB(215, 65, 65, 65)),
              ),
              leading: Icon(Icons.language),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AppRouts.address);
              },
              child: ListTile(
                title: Text(
                  "Addres",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Color.fromARGB(215, 65, 65, 65)),
                ),
                leading: Icon(Icons.location_on_outlined),
              ),
            ),
            ListTile(
              title: Text(
                "About us",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Color.fromARGB(215, 65, 65, 65)),
              ),
              leading: Icon(Icons.help_outline_rounded),
            ),
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse("tel:01202630742"));
              },
              child: ListTile(
                title: Text(
                  "contect us",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Color.fromARGB(215, 65, 65, 65)),
                ),
                leading: Icon(Icons.call),
              ),
            ),
            InkWell(
              onTap: () {
                controller.logout();
              },
              child: ListTile(
                title: Text(
                  "Log out",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Color.fromARGB(215, 65, 65, 65)),
                ),
                leading: Icon(Icons.logout_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}
