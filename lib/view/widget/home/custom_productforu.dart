import 'package:flutter/material.dart';

class CustomProductForU extends StatelessWidget {
  const CustomProductForU({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Row(
        children: const [
          Text(
            "Products for you",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.arrow_forward_ios_sharp)
        ],
      ),
    );
  }
}
