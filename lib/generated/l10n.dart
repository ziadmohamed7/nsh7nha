// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome back`
  String get title {
    return Intl.message(
      'Welcome back',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get login {
    return Intl.message(
      'Sign in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign In With`
  String get signInWith {
    return Intl.message(
      'Or Sign In With',
      name: 'signInWith',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Let's create your account`
  String get registerHeader {
    return Intl.message(
      'Let\'s create your account',
      name: 'registerHeader',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameField {
    return Intl.message(
      'Name',
      name: 'nameField',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phoneField {
    return Intl.message(
      'Phone',
      name: 'phoneField',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign Up With`
  String get signUpWith {
    return Intl.message(
      'Or Sign Up With',
      name: 'signUpWith',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification`
  String get emailVerification {
    return Intl.message(
      'Email Verification',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to your email`
  String get emailVerificationHeader {
    return Intl.message(
      'Enter the code sent to your email',
      name: 'emailVerificationHeader',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendCode {
    return Intl.message(
      'Send',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Don't Receive Code ?`
  String get dontReceiveCode {
    return Intl.message(
      'Don\'t Receive Code ?',
      name: 'dontReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resendCode {
    return Intl.message(
      'Resend',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address . `
  String get forgetPasswordHeader {
    return Intl.message(
      'Please enter your email address . ',
      name: 'forgetPasswordHeader',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordButton {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Otp Code`
  String get otpCodeFiled {
    return Intl.message(
      'Otp Code',
      name: 'otpCodeFiled',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordField {
    return Intl.message(
      'New Password',
      name: 'newPasswordField',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterYourPasswordHead {
    return Intl.message(
      'Enter New Password',
      name: 'enterYourPasswordHead',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get EmailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'EmailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get EnterAValidEmailAddress {
    return Intl.message(
      'Enter a valid email address',
      name: 'EnterAValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get PasswordIsRequired {
    return Intl.message(
      'Password is required',
      name: 'PasswordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `password must be at least 8 digits long`
  String get shortPassword {
    return Intl.message(
      'password must be at least 8 digits long',
      name: 'shortPassword',
      desc: '',
      args: [],
    );
  }

  /// `passwords must have at least one special character`
  String get passwordValidator {
    return Intl.message(
      'passwords must have at least one special character',
      name: 'passwordValidator',
      desc: '',
      args: [],
    );
  }

  /// `name filed is required !`
  String get nameFiledIsRequired {
    return Intl.message(
      'name filed is required !',
      name: 'nameFiledIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid phone number`
  String get EnterValidPhoneNumber {
    return Intl.message(
      'Enter valid phone number',
      name: 'EnterValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cartTitle {
    return Intl.message(
      'Cart',
      name: 'cartTitle',
      desc: '',
      args: [],
    );
  }

  /// `name is short .`
  String get shortName {
    return Intl.message(
      'name is short .',
      name: 'shortName',
      desc: '',
      args: [],
    );
  }

  /// `please enter valid name `
  String get invalidName {
    return Intl.message(
      'please enter valid name ',
      name: 'invalidName',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
