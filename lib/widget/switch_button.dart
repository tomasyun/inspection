import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inspection/widget/switch_button_lerp.dart';
import 'package:inspection/widget/switch_button_printer.dart';

// ignore: must_be_immutable
class SwitchButton extends StatefulWidget {
  SwitchButton(
      {Key key, this.size = const Size(50.0, 30.0), this.isOpen = true})
      : super(key: key);
  Size size;
  bool isOpen;

  @override
  State createState() => new _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with TickerProviderStateMixin {
  AnimationController animationController;
  SwitchButtonTween switchButtonTween;

  @override
  void initState() {
    super.initState();
  }

  void _tap(PointerDownEvent event) {
    final radius = widget.size.height / 2.0;
    final circleCenter =
        new Offset(widget.isOpen ? widget.size.width - radius : radius, radius);
    if (_isInCircle(radius, circleCenter, event.position)) {
    } else {}
    setState(() {
      widget.isOpen = !widget.isOpen;
    });
  }

  bool _isInCircle(double radius, Offset circleCenter, Offset point) =>
      pow(point.dx - circleCenter.dx, 2) + pow(point.dy - circleCenter.dy, 2) <=
      pow(radius, 2);

  @override
  Widget build(BuildContext context) {
    setState(() {
      animationController = new AnimationController(
          vsync: this, duration: new Duration(milliseconds: 10));
      switchButtonTween = new SwitchButtonTween(
          new SwitchButtonLerp(
              isOpen: widget.isOpen, fraction: widget.isOpen ? 0.0 : 1.0),
          new SwitchButtonLerp(
              isOpen: widget.isOpen, fraction: widget.isOpen ? 1.0 : 0.0));
      animationController.forward();
    });
    return new Listener(
      onPointerDown: _tap,
      child: new CustomPaint(
        size: widget.size,
        painter: new SwitchButtonPainter(
            switchButtonTween.animate(animationController)),
      ),
    );
  }
}
