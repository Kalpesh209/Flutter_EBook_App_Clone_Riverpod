import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CustomIndicator extends CircularWaveIndicatorPainter {
  CustomIndicator(
      {required super.currentIndicatorColor,
      required super.indicatorBackgroundColor});

  Widget build() {
    return const Text('sample');
  }
}
