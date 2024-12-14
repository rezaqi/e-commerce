import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.ph,
    required this.borderR,
    required this.textColor,
    required this.color,
    required this.onPress,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    required this.hight,
  });

  final double hight;
  final double ph;
  final double borderR;
  final Color textColor;
  final Color color;
  final void Function()? onPress;

  final String text;
  final double fontsize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ph),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderR),
        child: MaterialButton(
          height: hight,
          elevation: 0,
          textColor: textColor,
          color: color,
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: fontsize,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
