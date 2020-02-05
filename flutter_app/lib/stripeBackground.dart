import 'package:flutter/material.dart';

class BackGround extends CustomPainter {
  double heX = 50.0;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.grey[200];
    paint.strokeWidth = 1.0;
    paint.isAntiAlias = true;
/*    for (; heX < size.height; heX = heX + 25.0) {
      canvas.drawLine(
          Offset(0, heX), Offset(size.width, heX), paint);
    }*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
/*
    canvas.drawLine(
        Offset(100, -40), Offset(size.width + 60, size.width - 40), paint2);
    canvas.drawLine(
        Offset(0, 0), Offset(size.width + 60, size.width + 80), paint);
    canvas.drawLine(
        Offset(-100, 40), Offset(size.width + 60, size.width + 200), paint2);
    canvas.drawLine(
        Offset(-200, 90), Offset(size.width + 60, size.width + 320), paint);
    canvas.drawLine(
        Offset(-300, 140), Offset(size.width + 60, size.width + 440), paint2);
    canvas.drawLine(
        Offset(-400, 190), Offset(size.width + 60, size.width + 560), paint);
    canvas.drawLine(
        Offset(-500, 240), Offset(size.width + 60, size.width + 680), paint2);
*/
