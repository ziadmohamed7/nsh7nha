import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsh7nha/constants.dart'; // Assuming primaryColor and greyColor are defined here.

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.radius = 25.0,
    this.isUpperCase = false,
    this.isEnabled = true,
  });

  final double width;
  final VoidCallback? onPressed; // Callback for button press
  final String text; // Text to display on the button
  final bool isUpperCase; // Flag to determine if text should be uppercased
  final bool isEnabled; // Condition to enable or disable the button
  final double radius; // Corner radius for the button

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: width,
      child: Platform.isIOS
          ? CupertinoButton(
              onPressed: isEnabled ? onPressed : null,
              color: isEnabled ? primaryColor : greyColor, // Button color
              borderRadius: BorderRadius.circular(radius), // Corner radius
              child: Text(
                isUpperCase ? text.toUpperCase() : text,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 18,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: isEnabled ? onPressed : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isEnabled
                    ? primaryColor // Custom background when enabled
                    : greyColor, // Grey color when disabled
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ),
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
