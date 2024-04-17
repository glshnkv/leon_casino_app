
import 'package:flutter/material.dart';

abstract class AppStyles {

  static TextStyle Bold16 (Color color) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle ExtraBold22 (Color color) {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle News16 (Color color) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  static TextStyle News14 (Color color) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  static TextStyle ExtraBold44 (Color color) {
    return TextStyle(
      fontSize: 44,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

}
