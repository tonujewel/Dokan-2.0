import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dotSpacing;

  DottedBorderPainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.dotSpacing = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final double circumference = 2 * 3.141592653589793238 * radius;
    final int numDots = (circumference / (strokeWidth + dotSpacing)).floor();
    final double dotLength = (circumference / numDots) - dotSpacing;

    for (int i = 0; i < numDots; i++) {
      final double startAngle = (2 * 3.141592653589793238 * i) / numDots;
      final double endAngle = startAngle + (dotLength / radius);

      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpacing;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.dashWidth = 6.0,
    this.dashSpacing = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final double circumference = 2 * 3.141592653589793238 * radius;
    final int numDashes = (circumference / (dashWidth + dashSpacing)).floor();

    for (int i = 0; i < numDashes; i++) {
      final double startAngle = (2 * 3.141592653589793238 * i) / numDashes;
      final double endAngle = startAngle + (dashWidth / radius);

      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
