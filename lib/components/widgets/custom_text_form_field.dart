import 'package:flutter/material.dart';

class BuildTextFormFiled extends StatelessWidget {
  const BuildTextFormFiled({
    super.key,
    required this.controller,
    required this.context,
    required this.label,
    required this.prefixIcon,
    required this.textType,
    this.isPassword = false,
    required this.validator,
    this.suffixIcon,
    this.suffixIconPressed,
  });

  final TextEditingController controller;
  final BuildContext context;
  final String label;
  final IconData prefixIcon;
  final TextInputType textType;
  final bool isPassword;
  final String? Function(String?) validator;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // problem that validator is not a function of a void but it return string
      validator: validator,
      keyboardType: textType,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: suffixIconPressed, icon: Icon(suffixIcon))
            : null,
        prefixIcon: Icon(prefixIcon),
        labelText: label,
      ),
    );
  }
}
