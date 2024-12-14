import 'package:flutter/material.dart';

class CusstomNavigatorButtom extends StatelessWidget {
  final void Function()? onPressed;

  final IconData icon;
  final bool? active;

  const CusstomNavigatorButtom(
      {super.key,
      required this.onPressed,
      required this.active,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
          onPressed: onPressed,
          child: Column(
            children: [
              Icon(
                icon,
                size: active == true ? 30 : 25,
                color: active == true
                    ? Color.fromARGB(255, 1, 21, 32)
                    : Color.fromARGB(255, 216, 216, 216),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
