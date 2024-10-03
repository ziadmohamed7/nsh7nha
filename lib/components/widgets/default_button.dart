import 'package:flutter/material.dart';
import 'package:nsh7nha/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.radius = 25.0,
    this.isUpperCase = false,
    this.isEnabled = true,
  });

  final double width;
  // Optional custom background color
  final VoidCallback onPressed; // Callback for button press
  final String text; // Text to display on the button
  final bool isUpperCase; // Flag to determine if text should be uppercased
  final bool isEnabled; // Condition to enable or disable the button
  final double radius; // Corner radius for the button

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
        onPressed: isEnabled
            ? onPressed
            : null, // Enable or disable based on condition
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? primaryColor // Use custom background if provided
              : greyColor, // Grey color when disabled
          // padding:
          //     const EdgeInsets.all(0), // No padding to avoid additional space
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(radius),
          // ),
        ),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
