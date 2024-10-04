import 'package:flutter/material.dart';
import 'package:nsh7nha/generated/l10n.dart';
import 'package:nsh7nha/screens/auth/views/register/register_cubit/register_cubit.dart';
import 'package:nsh7nha/screens/auth/views/register/register_cubit/register_states.dart';

import '../../../../adaptive/adaptive_button.dart';
import '../../../../components/widgets/custom_text_form_field.dart';
import '../../../../constants.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.onPressed,
    required this.state,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final VoidCallback onPressed;
  final StoreRegisterStates state;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            BuildTextFormFiled(
              controller: nameController,
              context: context,
              label: S.of(context).nameField,
              prefixIcon: Icons.person,
              textType: TextInputType.text,
              validator: nameValidator(context),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            BuildTextFormFiled(
                controller: emailController,
                context: context,
                label: S.of(context).email,
                prefixIcon: Icons.email_outlined,
                textType: TextInputType.emailAddress,
                validator: emailValidator(context)),
            const SizedBox(
              height: defaultPadding,
            ),
            BuildTextFormFiled(
                controller: phoneController,
                context: context,
                label: S.of(context).phoneField,
                prefixIcon: Icons.phone,
                textType: TextInputType.phone,
                validator: (value) {
                  if (value!.length > 11) {
                    return S.of(context).EnterValidPhoneNumber;
                  }
                  return null;
                }),
            const SizedBox(
              height: 16,
            ),
            BuildTextFormFiled(
                controller: passwordController,
                context: context,
                label: S.of(context).password,
                prefixIcon: Icons.password,
                suffixIcon: StoreRegisterCubit.get(context).isPassword
                    ? Icons.visibility
                    : Icons.visibility_off,
                suffixIconPressed: () {
                  StoreRegisterCubit.get(context).togglePasswordIcon();
                },
                textType: TextInputType.visiblePassword,
                isPassword: StoreRegisterCubit.get(context).isPassword,
                validator: passwordValidator(context)),
            const SizedBox(
              height: 32,
            ),
            state is StoreRegisterLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : AdaptiveButton(
                    onPressed: onPressed,
                    text: S.of(context).createAccount,
                  ),
          ],
        ),
      ),
    );
  }
}
