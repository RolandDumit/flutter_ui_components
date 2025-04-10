import 'package:flutter/material.dart';

extension ColorManipulationExtensions on Color {
  /// Returns a new darkened color based on the [percent] value.
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0.0 and 1.0');
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// Returns a new lightened color based on the [percent] value.
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0.0 and 1.0');
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// Saturate the color by [percent] value.
  Color saturate([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    final hslColor = HSLColor.fromColor(this);
    return hslColor.withSaturation((hslColor.saturation + percent / 100).clamp(0, 1)).toColor();
  }

  /// Desaturate the color by [percent] value.
  Color desaturate([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    final hslColor = HSLColor.fromColor(this);
    return hslColor.withSaturation((hslColor.saturation - percent / 100).clamp(0, 1)).toColor();
  }
}
