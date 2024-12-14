import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPageCustom extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final IconData icon;
  final void Function()? ontap;
  const ListPageCustom(
      {super.key,
      required this.title,
      required this.color,
      required this.textColor,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        width: Get.width,
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: textColor),
          ),
          leading: Icon(icon),
        ),
      ),
    );
  }
}
