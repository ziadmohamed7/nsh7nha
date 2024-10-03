import 'package:nsh7nha/models/user_model.dart';

abstract class StoreLoginStates {}

class StoreLoginInitialState extends StoreLoginStates {}

class StoreLoginLoadingState extends StoreLoginStates {}

class StoreLoginSuccessState extends StoreLoginStates {
  final StoreUserModel loginModel;

  StoreLoginSuccessState(this.loginModel);
}

class StoreLoginTogglePasswordState extends StoreLoginStates {}

class StoreLoginErrorState extends StoreLoginStates {
  final String error;
  StoreLoginErrorState({required this.error});
}
