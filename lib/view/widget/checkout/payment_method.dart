import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class PaymentMethod extends StatelessWidget {
  final String text;
  final bool isAc;
  const PaymentMethod({super.key, required this.text, required this.isAc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: Card(
            color: isAc == true ? AppColor.buttonCo : AppColor.seCo,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(text,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: isAc == true ? Colors.white : Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
}
