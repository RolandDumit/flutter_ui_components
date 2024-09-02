import 'package:flutter/material.dart';

class SlideGradient implements GradientTransform {
  final double value;
  final double offset;

  const SlideGradient(this.value, this.offset);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    final dist = value * (bounds.width + offset);
    return Matrix4.identity()..translate(-dist);
  }
}
