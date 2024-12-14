import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListAddress extends StatelessWidget {
  final String name;
  final String city;
  final String street;
  final void Function()? ontap;
  const CustomListAddress(
      {super.key,
      required this.city,
      required this.ontap,
      required this.street,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(

        // ============= city ============= //
        title: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: Get.width,
              // alignment: Alignment.,
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Text(
                city,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Positioned(
              top: -5,
              right: -5,
              child: InkWell(
                onTap: ontap,
                child: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.redAccent,
                ),
              ),
            )
          ],
        ),
        // ============= street ============= //

        subtitle: Container(
          padding: EdgeInsets.symmetric(horizontal: 13),
          width: Get.width,
          //   alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
          child: Text(street),
        ),

        // ============= name ============= //
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
