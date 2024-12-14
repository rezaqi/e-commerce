import 'package:flutter/material.dart';

class RowOrder extends StatelessWidget {
  final FontWeight? fontweight;
  final String title;
  final String body;
  final Color? color;

  const RowOrder({
    super.key,
    this.fontweight,
    required this.title,
    required this.body,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: fontweight, color: color),
        ),
        Text(
          body,
          style: TextStyle(fontSize: 20, fontWeight: fontweight, color: color),
        ),
      ],
    );
  }
}
