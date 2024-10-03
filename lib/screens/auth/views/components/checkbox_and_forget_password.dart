import 'package:flutter/material.dart';
import 'package:nsh7nha/generated/l10n.dart';

class CheckboxAndForgetPassword extends StatelessWidget {
  const CheckboxAndForgetPassword(
      {super.key,
      required this.forgetOnPressed,
      required this.valueOfCheckbox});
  final VoidCallback forgetOnPressed;
  final bool valueOfCheckbox;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                // fillColor:WidgetStateProperty Color Color(0xff1C2E51),
                value: valueOfCheckbox,
                onChanged: (value) => value = valueOfCheckbox),
            Text(S.of(context).rememberMe),
          ],
        ),
        TextButton(
          onPressed: forgetOnPressed,
          child: Text(S.of(context).forgetPassword),
        ),
      ],
    );
  }
}
