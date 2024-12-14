import 'package:flutter/material.dart';

class CustomStars {
  start(val) {
    if (val == "0" || val == 0) {
      return Row(children: [
        ...List.generate(
            5,
            (index) => const Icon(
                  Icons.star_outline_sharp,
                  size: 19,
                ))
      ]);
    }
    ///////////////////////////
    if (val == "1" || val == 1) {
      return Row(
        children: [
          Icon(Icons.star, color: Colors.yellow, size: 19),
          ...List.generate(
              4,
              (index) => const Icon(
                    Icons.star_outline_sharp,
                    size: 19,
                  ))
        ],
      );
    }
    ///////////////////////////
    if (val == "2" || val == 2) {
      return Row(
        children: [
          Icon(Icons.star, color: Colors.yellow, size: 19),
          Icon(Icons.star, color: Colors.yellow, size: 19),
          ...List.generate(
              3,
              (index) => const Icon(
                    Icons.star_outline_sharp,
                    size: 19,
                  ))
        ],
      );
    }
    ///////////////////////////
    if (val == "3" || val == 3) {
      return Row(
        children: [
          ...List.generate(
            3,
            (index) => const Icon(Icons.star, color: Colors.yellow, size: 19),
          ),
          Icon(
            Icons.star_outline_sharp,
            size: 19,
          ),
          Icon(
            Icons.star_outline_sharp,
            size: 19,
          ),
        ],
      );
    }
    ///////////////////////////
    if (val == "4" || val == 4) {
      return Row(
        children: [
          ...List.generate(
              4,
              (index) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 19,
                  )),
          Icon(
            Icons.star_outline_sharp,
            size: 19,
          ),
        ],
      );
    } else {
      return Row(
        children: [
          ...List.generate(
              5,
              (index) => const Icon(
                    Icons.star,
                    size: 19,
                    color: Colors.yellow,
                  ))
        ],
      );
    }
  }
}
