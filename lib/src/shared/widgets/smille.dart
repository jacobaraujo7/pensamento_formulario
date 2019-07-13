import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Smiley extends StatelessWidget {
  final double range;

  const Smiley({Key key, this.range = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SmileyPainter(range),
    );
  }
}

class SmileyPainter extends CustomPainter {
  final double range;

  SmileyPainter(this.range);

  rangeValue(double min, double max, double range) {
    return range * (max - min) + min;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = Math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    // Draw the body
    final paint = Paint()..color = Color.lerp(Colors.blue, Colors.red, range);
    canvas.drawCircle(center, radius, paint);
    // Draw the mouth
    // final smilePaint = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 10;
    // canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 2), 0,
    //     Math.pi, false, smilePaint);

    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    paint.color = Colors.lightBlue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;

    final double widthRadius = size.width * 0.2;

    final double minHeightEndPoint = size.height * 0.5;
    final double maxHeightEndPoint = size.height * 0.7;

    final double minHeightMiddlePoint = size.height * 0.8;
    final double maxHeightMiddlePoint = size.height / 3;

    var startPoint = Offset(
        widthRadius, rangeValue(minHeightEndPoint, maxHeightEndPoint, range));
    var controlPoint1 = Offset(size.width / 4,
        rangeValue(minHeightMiddlePoint, maxHeightMiddlePoint, range));
    var controlPoint2 = Offset(3 * size.width / 4,
        rangeValue(minHeightMiddlePoint, maxHeightMiddlePoint, range));
    var endPoint = Offset((size.width - widthRadius),
        rangeValue(minHeightEndPoint, maxHeightEndPoint, range));

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, smilePaint);

    // // Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2), 10, Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2), 10, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
