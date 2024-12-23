import 'dart:math';
import 'package:flutter/material.dart';

class PendulumPainter extends CustomPainter {
  final double x;
  final double y;
  final double length;
  final double angle;
  PendulumPainter(this.x, this.y, this.length, this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    Paint arcPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Paint bobPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    /// Vẽ dây con lắc
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2 + x, y),
      linePaint,
    );

    /// Vẽ quả lắc
    canvas.drawCircle(
      Offset(size.width / 2 + x, y),
      20,
      bobPaint,
    );

    /// Vẽ đường thẳng ở trên
    canvas.drawLine(
      Offset(size.width / 2 - 100, 0),
      Offset(size.width / 2 + 100, 0),
      linePaint,
    );

    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, 0),
      radius: length,
    );

    /// Vẽ cung tròn
    canvas.drawArc(
      rect,
      pi / 4,
      pi / 2,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
