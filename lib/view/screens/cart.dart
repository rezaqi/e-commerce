import 'package:flutter/material.dart';
import 'package:rezaqi_ecommerce/view/widget/crat/list_buttom.dart';
import '../widget/crat/cart_title_page_custom.dart';
import '../widget/crat/coupon.dart';
import '../widget/crat/list_cart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomCartTitlePage(),
          CustomListCart(),
          Coupon(),
          SizedBox(
            height: 20,
          ),
          CustomListAndButtom()
        ],
      ),
    );
  }
}
