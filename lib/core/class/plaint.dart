import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromRGBO(44, 94, 230, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.quadraticBezierTo(size.width * 0.09, size.height * 0.09,
        size.width * 0.5, size.height * 0.1);
    path0.quadraticBezierTo(
        size.width * 0.9, size.height * 0.09, size.width, 0);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
