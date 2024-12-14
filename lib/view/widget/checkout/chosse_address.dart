import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class ChosseAddress extends StatelessWidget {
  final String text;
  final bool isAc;
  const ChosseAddress({super.key, required this.text, required this.isAc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isAc == true ? AppColor.buttonCo : AppColor.seCo,
          borderRadius: BorderRadius.circular(15)),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: isAc == true ? Colors.white : Colors.black)),
    );
  }
}
