import 'package:flutter/material.dart';

import 'advanced_icon_enums.dart';

class AdvancedIconMatrix {
  static Matrix4 create({
    required AdvancedIconEffect effect,
    required double progress,
    required double path,
    required double angle,
  }) {
    switch (effect) {
      case AdvancedIconEffect.bubble:
      case AdvancedIconEffect.bubbleFade:
        return Matrix4.identity()..scale(progress);
      case AdvancedIconEffect.spin:
        return Matrix4.identity()..rotateZ(angle);
      case AdvancedIconEffect.spinBubble:
        return Matrix4.identity()
          ..scale(progress)
          ..rotateZ(angle);
      case AdvancedIconEffect.flipH:
        return Matrix4.identity()
          ..translate(path)
          ..rotateY(angle);
      case AdvancedIconEffect.flipV:
        return Matrix4.identity()
          ..translate(0.0, path)
          ..rotateX(angle);
      default:
        return Matrix4.identity();
    }
  }
}
