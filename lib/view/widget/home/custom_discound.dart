import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/home/home_controller.dart';

class CustomDiscound extends StatelessWidget {
  const CustomDiscound({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Container(
      height: 140,
      width: 400,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color.fromARGB(255, 56, 73, 81), Colors.blueAccent]),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          const Positioned(
            right: -5,
            top: -30,
            child: SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                backgroundColor: Colors.indigo,
              ),
            ),
          ),
          const Positioned(
            left: 30,
            top: 10,
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 13, 71, 67),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.title}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  "${controller.body}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
