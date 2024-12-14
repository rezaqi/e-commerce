import 'package:flutter/material.dart';

class ButtonSingInput extends StatelessWidget {
  const ButtonSingInput(
      {super.key,
      required this.title,
      required this.color,
      required this.onPress});
  final String title;
  final Color color;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
        color: color,
        onPressed: onPress,
        child: Text(title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
