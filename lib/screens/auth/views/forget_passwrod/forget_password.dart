import 'package:flutter/material.dart';
import 'package:nsh7nha/adaptive/adaptive_button.dart';
import 'package:nsh7nha/components/widgets/custom_text_form_field.dart';
import 'package:nsh7nha/constants.dart';
import 'package:nsh7nha/generated/l10n.dart';
import 'package:nsh7nha/route/route_constants.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).forgetPassword,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              S.of(context).forgetPasswordHeader,
              style: const TextStyle(
                color: greyColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  BuildTextFormFiled(
                    controller: emailController,
                    context: context,
                    label: S.of(context).email,
                    prefixIcon: Icons.email_outlined,
                    textType: TextInputType.emailAddress,
                    validator: emailValidator(context),
                  ),
                  const SizedBox(
                    height: defaultPadding * 2,
                  ),
                  AdaptiveButton(
                    onPressed: () {
                      Navigator.pushNamed(context, otpScreenRoute);
                      // if (formKey.currentState!.validate()) {
                      //   print(emailController.text);
                      //
                      // }
                    },
                    text: S.of(context).resetPasswordButton,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
