import 'dart:ui';

class SwitchButtonLerp {
  SwitchButtonLerp({
    this.isOpen = false,
    this.fraction,
  });

  bool isOpen;
  double fraction;

  static SwitchButtonLerp lerp(
    SwitchButtonLerp begin,
    SwitchButtonLerp end,
    double fraction,
  ) =>
      new SwitchButtonLerp(
          fraction: lerpDouble(
        begin.fraction,
        end.fraction,
        fraction,
      ));
}
