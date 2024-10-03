import 'package:flutter/material.dart';
import 'package:nsh7nha/components/widgets/custom_text_form_field.dart';
import 'package:nsh7nha/constants.dart';
import 'package:nsh7nha/generated/l10n.dart';

import '../../../../components/widgets/default_button.dart';
import '../components/otp_submit.dart';

class OtpForgetPassword extends StatefulWidget {
  const OtpForgetPassword({super.key});

  @override
  State<OtpForgetPassword> createState() => _OtpForgetPasswordState();
}

class _OtpForgetPasswordState extends State<OtpForgetPassword> {
  bool isPassword = true;
  // TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Verify Otp'),
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).otpCodeFiled),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    OtpSubmit(
                      onSubmit: (verificationCode) {},
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Text(S.of(context).enterYourPasswordHead),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    BuildTextFormFiled(
                      controller: passwordController,
                      context: context,
                      label: S.of(context).newPasswordField,
                      prefixIcon: Icons.email_outlined,
                      isPassword: isPassword,
                      suffixIcon:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      suffixIconPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      textType: TextInputType.emailAddress,
                      validator: passwordValidator(context),
                    ),
                    const SizedBox(
                      height: defaultPadding * 2,
                    ),
                    DefaultButton(
                      onPressed: () {},
                      text: S.of(context).sendCode,
                      isUpperCase: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
