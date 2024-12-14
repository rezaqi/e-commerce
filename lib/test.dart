import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          height: 100,
          width: 300,
          child: CustomPaint(
            painter: RPSCustomPainter(),
          )),
    ));
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromRGBO(44, 94, 230, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.lineTo(0, size.width);
    path0.moveTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);

    path0.lineTo(0, 0);
    path0.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path0.quadraticBezierTo(size.width, size.height, size.width, size.height);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
