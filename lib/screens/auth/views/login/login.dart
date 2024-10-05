import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/components/helper/toast.dart';
import 'package:nsh7nha/constants.dart';
import 'package:nsh7nha/route/route_constants.dart';
import 'package:nsh7nha/screens/auth/views/components/login_form.dart';
import 'package:nsh7nha/screens/auth/views/components/login_header.dart';
import 'package:nsh7nha/screens/auth/views/login/login_cubit/login_cubit.dart';
import 'package:nsh7nha/screens/auth/views/login/login_cubit/login_states.dart';

import '../../../../components/helper/footer_icons.dart';
import '../../../../components/widgets/flexible_divider.dart';
import '../../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreLoginCubit(),
      child: BlocConsumer<StoreLoginCubit, StoreLoginStates>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: defaultPadding,
                    bottom: defaultPadding,
                    left: defaultPadding,
                  ),
                  child: Column(
                    children: [
                      const LoginHeader(),
                      // Login Form
                      LoginForm(
                        state: state,
                        buttonOnPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await StoreLoginCubit.get(context).signIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            //
                          }
                        },
                        formKey: formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        forgetOnPressed: () {
                          Navigator.pushNamed(
                              context, passwordRecoveryScreenRoute);
                        },
                      ),

                      // Forget password and other UI elements
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FlexibleDivider(endIndent: 5, indent: 60),
                          Text(S.of(context).signInWith,
                              style: Theme.of(context).textTheme.labelMedium),
                          const FlexibleDivider(endIndent: 60, indent: 5),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding * 2,
                      ),
                      const FooterIcons(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is StoreLoginSuccessState) {
            ShowToast(
                message: state.loginModel.message, state: ToastStates.Suceess);
            Navigator.pushReplacementNamed(context, homeScreenRoute);
          } else if (state is StoreLoginErrorState) {
            ShowToast(message: state.error, state: ToastStates.Error);
          }
        },
      ),
    );
  }
}
