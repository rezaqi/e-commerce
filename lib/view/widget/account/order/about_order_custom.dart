import 'package:flutter/material.dart';

import '../../../screens/acc/order/detils.dart';
import 'detils/roe_order_detils_custom.dart';

class AboutOrder extends StatelessWidget {
  final String order;
  final String payment;
  final String discount;
  final String delivery;
  final String price;
  final String totalprice;
  const AboutOrder(
      {super.key,
      required this.order,
      required this.payment,
      required this.discount,
      required this.delivery,
      required this.price,
      required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown[300], borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            order,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          RowOrder(title: "Payment Method", body: payment),
          RowOrder(title: "Discount", body: discount),
          RowOrder(title: "Delivery price", body: delivery),
          RowOrder(title: "Price", body: price),
          RowOrder(
            title: "Total price",
            body: totalprice,
            color: Colors.tealAccent[400],
            fontweight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
