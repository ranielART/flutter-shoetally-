import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const IconButtonComponent({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      label: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
