import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleItems extends StatelessWidget {
  final String? title;
  final void Function()? ontap;
  const CustomTitleItems({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        children: [
          Text(
            title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: ontap, child: const Icon(Icons.arrow_forward_ios_sharp))
        ],
      ),
    );
  }
}
