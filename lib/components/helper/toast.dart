import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void ShowToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 3,
    backgroundColor: ToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Color ToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.Suceess:
      color = Colors.green;
      break;

    case ToastStates.Error:
      color = Colors.red;
      break;

    case ToastStates.Warning:
      color = Colors.amber;
      break;
  }
  return color;
}

enum ToastStates {
  Suceess,
  Warning,
  Error,
}
