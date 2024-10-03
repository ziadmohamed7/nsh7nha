import 'package:flutter/cupertino.dart';
import 'package:nsh7nha/route/route_constants.dart';
import 'package:nsh7nha/screens/auth/views/forget_passwrod/forget_password.dart';
import 'package:nsh7nha/screens/auth/views/forget_passwrod/otp_forget_password.dart';
import 'package:nsh7nha/screens/auth/views/register/register.dart';
import 'package:nsh7nha/screens/cart/views/cart_view.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home.dart';

import '../screens/auth/views/login/login.dart';

Map<String, WidgetBuilder> routes(context) {
  return {
    logInScreenRoute: (context) => LoginScreen(),
    signUpScreenRoute: (context) => RegisterScreen(),
    passwordRecoveryScreenRoute: (context) => ForgetPassword(),
    otpScreenRoute: (context) => const OtpForgetPassword(),
    cartScreenRoute: (context) => const CartView(),
    homeScreenRoute: (context) => const HomeView(),
  };
}
