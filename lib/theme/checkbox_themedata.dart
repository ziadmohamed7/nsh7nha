import 'package:flutter/material.dart';

import '../constants.dart';

CheckboxThemeData checkboxThemeData = const CheckboxThemeData(
  checkColor: WidgetStatePropertyAll(Colors.white),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(defaultBorderRadious / 2),
    ),
  ),
);
