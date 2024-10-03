import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../constants.dart';

class OtpSubmit extends StatelessWidget {
  const OtpSubmit({
    super.key,
    required this.onSubmit,
    this.onCodeChanged,
  });
  final Function(String) onSubmit;
  final Function(String)? onCodeChanged;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      numberOfFields: 6,
      fieldWidth: 50,
      focusedBorderColor: primaryColor,
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      clearText: true,
      onSubmit: onSubmit,
      onCodeChanged: onCodeChanged,
    );
  }
}
