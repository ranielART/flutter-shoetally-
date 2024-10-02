import 'package:flutter/material.dart';

class CustomButtonStyle {
  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFFA259FF),
      minimumSize: const Size.fromHeight(60),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
