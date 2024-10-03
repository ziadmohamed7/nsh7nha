import 'package:flutter/material.dart';
import 'package:nsh7nha/generated/l10n.dart';
import 'package:nsh7nha/screens/auth/views/login/login_cubit/login_cubit.dart';

import '../../../../components/widgets/custom_outlined_buuton.dart';
import '../../../../components/widgets/custom_text_form_field.dart';
import '../../../../components/widgets/default_button.dart';
import '../../../../constants.dart';
import '../../../../route/route_constants.dart';
import '../login/login_cubit/login_states.dart';
import 'checkbox_and_forget_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.forgetOnPressed,
    required this.buttonOnPressed,
    required this.state,
  });
  final GlobalKey<FormState> formKey;
  final VoidCallback forgetOnPressed;
  final VoidCallback buttonOnPressed;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final StoreLoginStates state;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding * 2),
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
              height: defaultPadding,
            ),
            BuildTextFormFiled(
              controller: passwordController,
              context: context,
              label: S.of(context).password,
              prefixIcon: Icons.password,
              suffixIcon: StoreLoginCubit.get(context).isPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
              isPassword: StoreLoginCubit.get(context).isPassword,
              suffixIconPressed: () {
                StoreLoginCubit.get(context).togglePasswordIcon();
              },
              textType: TextInputType.visiblePassword,
              validator: passwordValidator(context),
            ),
            CheckboxAndForgetPassword(
                forgetOnPressed: forgetOnPressed, valueOfCheckbox: false),

            const SizedBox(
              height: 24,
            ),

            // sign in with
            state is StoreLoginLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : DefaultButton(
                    onPressed: buttonOnPressed,
                    text: S.of(context).login,
                  ),

            const SizedBox(
              height: 24,
            ),

            CustomOutlinedButton(
                text: S.of(context).createAccount, route: signUpScreenRoute),
          ],
        ),
      ),
    );
  }
}
