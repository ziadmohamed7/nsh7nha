import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/components/helper/toast.dart';
import 'package:nsh7nha/constants.dart';
import 'package:nsh7nha/generated/l10n.dart';
import 'package:nsh7nha/screens/auth/views/components/register_form.dart';
import 'package:nsh7nha/screens/auth/views/email_verfication/email_verification.dart';
import 'package:nsh7nha/screens/auth/views/register/register_cubit/register_cubit.dart';
import 'package:nsh7nha/screens/auth/views/register/register_cubit/register_states.dart';

import '../../../../components/helper/footer_icons.dart';
import '../../../../components/widgets/flexible_divider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String id = 'register';
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreRegisterCubit(),
      child: BlocConsumer<StoreRegisterCubit, StoreRegisterStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).registerHeader,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      RegisterForm(
                        formKey: formKey,
                        state: state,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            StoreRegisterCubit.get(context).signUp(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                          }
                        },
                        nameController: nameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        phoneController: phoneController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const FlexibleDivider(endIndent: 5, indent: 60),
                          Text(S.of(context).signUpWith),
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
          if (state is StoreRegisterSuccessState) {
            // ShowToast(
            //   message: state.registerModel.message,
            //   state: ToastStates.Success,
            // );

            StoreRegisterCubit.get(context)
                .sendEmailVerification(email: state.registerModel.data.email);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EmailVerification(
                email: state.registerModel.data.email,
              );
            }));
          } else if (state is StoreRegisterErrorState) {
            ShowCustomToast(
              message: state.error,
              state: ToastStates.Error,
              context: context,
            );
          }
        },
      ),
    );
  }
}
