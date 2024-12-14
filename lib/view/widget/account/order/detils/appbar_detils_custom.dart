import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowItemDetils extends StatelessWidget {
  final String image;
  final String name;
  final String count;
  final String price;
  const RowItemDetils(
      {super.key,
      required this.image,
      required this.name,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
          alignment: Alignment.bottomLeft,
          color: const Color.fromARGB(255, 72, 71, 71),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 200,
          width: 250,
          child: Stack(
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                height: Get.height,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black87, Colors.white10],
                        end: Alignment.centerRight)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Name : ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Count : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          count,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Price : ",
                          style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

// Stack(
//           alignment: Alignment.bottomLeft,
//           children: [
// SizedBox(
//   height: Get.height,
//   width: Get.width,
//   child: Image.network(
//     image,
//     fit: BoxFit.cover,
//   ),
//),
// Container(
//   alignment: Alignment.bottomLeft,
//   height: Get.height,
//   width: Get.width,
//   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//   decoration: const BoxDecoration(
//       gradient: LinearGradient(
//           colors: [Colors.black87, Colors.white10],
//           end: Alignment.centerRight)),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//       Row(
//         children: [
//           const Text(
//             "Name : ",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600),
//           ),
//           Text(
//             name,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//               fontSize: 18,
//             ),
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           const Text(
//             "Count : ",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//               fontSize: 18,
//             ),
//           ),
//           Text(
//             count,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600),
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           const Text(
//             "Price : ",
//             style: TextStyle(
//                 color: Colors.tealAccent,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600),
//           ),
//           Text(
//             price,
//             style: const TextStyle(
//                 color: Colors.tealAccent,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600),
//           ),
//         ],
//       ),
//     ],
//   ),
// ),
//  ],
// ),
