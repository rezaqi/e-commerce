import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class OrderStatus extends StatelessWidget {
  final String status;
  final String time;
  const OrderStatus({super.key, required this.status, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown[300], borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Order Status",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                Jiffy.parse(time).fromNow(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
