import 'package:nsh7nha/models/user_model.dart';

abstract class StoreRegisterStates {}

class StoreRegisterInitialState extends StoreRegisterStates {}

class StoreRegisterSuccessState extends StoreRegisterStates {
  final StoreUserModel registerModel;

  StoreRegisterSuccessState(this.registerModel);
}

class StoreRegisterErrorState extends StoreRegisterStates {
  final String error;

  StoreRegisterErrorState({required this.error});
}

class StoreRegisterLoadingState extends StoreRegisterStates {}

class StoreRegisterTogglePasswordState extends StoreRegisterStates {}

class StoreRegisterEmailVerificationSuccessState extends StoreRegisterStates {}

class StoreRegisterEmailVerificationErrorState extends StoreRegisterStates {}
