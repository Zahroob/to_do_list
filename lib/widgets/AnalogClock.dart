import 'package:flutter/material.dart';

class AnalogClock extends StatelessWidget {
  final BoxDecoration decoration;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;
  final Color numberColor;
  final bool showDigitalClock;
  final bool showTicks;
  final int height;
  final int width;
  const AnalogClock({
    super.key,
    required this.decoration,
    required this.hourHandColor,
    required this.minuteHandColor,
    required this.secondHandColor,
    required this.numberColor,
    required this.showDigitalClock,
    required this.showTicks,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnalogClock(
      decoration: decoration,
      hourHandColor: hourHandColor,
      minuteHandColor: minuteHandColor,
      secondHandColor: secondHandColor,
      numberColor: numberColor,
      showDigitalClock: showDigitalClock,
      showTicks: showTicks,
      height: height,
      width: width,
    );
  }
}
