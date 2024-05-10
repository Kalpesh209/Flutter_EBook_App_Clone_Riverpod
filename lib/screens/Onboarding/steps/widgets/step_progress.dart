import 'package:flutter/material.dart';

class StepProgress extends StatelessWidget {
  final double value;
  final double minVal;
  final double maxVal;
  const StepProgress(
      {Key? key,
      required this.value,
      required this.minVal,
      required this.maxVal})
      : super(key: key);
  double normalize(double value, double min, double max) {
    return ((value - min) / (max - min)).clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: LinearProgressIndicator(
        value: normalize(value, minVal, maxVal),
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }
}
