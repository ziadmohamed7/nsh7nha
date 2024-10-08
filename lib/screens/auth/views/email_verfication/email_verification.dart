import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/components/helper/toast.dart';
import 'package:nsh7nha/constants.dart';
import 'package:nsh7nha/generated/l10n.dart';
import 'package:nsh7nha/screens/auth/views/email_verfication/emailVerification_cubit/email_verification_states.dart';

import '../../../../adaptive/adaptive_button.dart';
import '../../../../route/route_constants.dart';
import '../components/otp_submit.dart';
import 'emailVerification_cubit/email_verification_cubit.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => StoreEmailVerificationCubit(),
        child: BlocConsumer<StoreEmailVerificationCubit,
            StoreEmailVerificationStates>(
          listener: (context, state) {
            if (state is StoreEmailVerificationSuccessState) {
              ShowCustomToast(
                  message: state.message,
                  state: ToastStates.Success,
                  context: context);
              Navigator.pushReplacementNamed(context, homeScreenRoute);
            } else if (state is StoreEmailVerificationErrorState) {
              ShowCustomToast(
                  message: 'error otp code .',
                  state: ToastStates.Error,
                  context: context);
            }
          },
          builder: (context, state) {
            StoreEmailVerificationCubit cubit =
                StoreEmailVerificationCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Text(
                    S.of(context).emailVerification,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    S.of(context).emailVerificationHeader,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'ziad@gmail.com',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtpSubmit(
                          onSubmit: (verificationCode) {
                            cubit.setOtpCode(value: verificationCode);
                            cubit.changeButtonEnable();
                          },
                        ),
                        const SizedBox(
                          height: defaultPadding * 2,
                        ),
                        AdaptiveButton(
                          isEnabled: cubit.isEnabled,
                          onPressed: () {
                            print(cubit.otpCode);
                            cubit.matchEmailOtp(
                                otpCode: cubit.otpCode, email: email);
                          },
                          text: S.of(context).sendCode,
                          isUpperCase: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        S.of(context).dontReceiveCode,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          S.of(context).resendCode,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
