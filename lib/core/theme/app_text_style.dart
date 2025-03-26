import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle style({
    required double textSize,
    required Color textColor,
    required FontWeight textWeight,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: textSize,
      color: textColor,
      fontWeight: textWeight,
      decoration: decoration,
    );
  }
}
