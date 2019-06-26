import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inspection/widget/switch_button_lerp.dart';

class SwitchButtonTween extends Tween<SwitchButtonLerp> {
  SwitchButtonTween(
    SwitchButtonLerp begin,
    SwitchButtonLerp end,
  ) : super(begin: begin, end: end);

  @override
  SwitchButtonLerp lerp(double fraction) =>
      SwitchButtonLerp.lerp(begin, end, fraction);
}

class SwitchButtonPainter extends CustomPainter {
  SwitchButtonPainter(Animation<SwitchButtonLerp> animation)
      : animation = animation,
        super(repaint: animation);

  Animation<SwitchButtonLerp> animation;

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final double animationValue = animation.value.fraction;
    final bool openState = animation.value.isOpen;
    final paint = Paint()
      ..color = openState ? Colors.green : Colors.red
      ..style = PaintingStyle.fill;
    final path = Path();
    final pRadius = size.height / 2.0;
    for (double a = 0.0; a < 360.0; a += 0.001) {
      double x = pRadius + pRadius * cos(a * pi / 180.0);
      double y = pRadius + pRadius * sin(a * pi / 180.0);
      if (a != 0.0)
        path.lineTo(x, y);
      else
        path.moveTo(x, y);
    }
    path.addRect(
        new Rect.fromLTWH(pRadius, 0.0, size.width - 2 * pRadius, size.height));
    for (double a = 0.0; a < 360.0; a += 0.001) {
      double x =
          size.width - 2 * pRadius + pRadius + pRadius * cos(a * pi / 180.0);
      double y = pRadius + pRadius * sin(a * pi / 180.0);
      if (a != 0.0)
        path.lineTo(x, y);
      else
        path.moveTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
    paint.color = Colors.white;
    canvas.drawCircle(
        new Offset(
            pRadius + animationValue * (size.width - 2 * pRadius), pRadius),
        pRadius,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
