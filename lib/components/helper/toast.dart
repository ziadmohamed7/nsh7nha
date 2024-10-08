import 'package:flutter/material.dart';

void ShowCustomToast({
  required BuildContext context,
  required String message,
  required ToastStates state,
}) {
  // Remove any existing toast
  OverlayEntry? currentToast;

  // Create a new OverlayEntry
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 50.0,
      left: 20.0,
      right: 20.0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: ToastColor(state),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                stateIcon(state),
                color: Colors.white,
              ),
              const SizedBox(width: 12.0),
              Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  // Insert the overlay entry
  Overlay.of(context).insert(overlayEntry);
  currentToast = overlayEntry;

  // Remove the toast after a delay
  Future.delayed(const Duration(seconds: 3), () {
    currentToast?.remove();
    currentToast = null;
  });
}

// Custom Toast Color based on Toast State
Color ToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.Success:
      return Colors.green;
    case ToastStates.Error:
      return Colors.red;
    case ToastStates.Warning:
      return Colors.amber;
    default:
      return Colors.grey; // Fallback color
  }
}

// Custom Icon based on Toast State
IconData stateIcon(ToastStates state) {
  switch (state) {
    case ToastStates.Success:
      return Icons.check_circle;
    case ToastStates.Error:
      return Icons.error;
    case ToastStates.Warning:
      return Icons.warning;
    default:
      return Icons.info; // Fallback icon
  }
}

enum ToastStates {
  Success,
  Warning,
  Error,
}
