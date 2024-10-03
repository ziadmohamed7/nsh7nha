import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/components/helper/secure_storage.dart';
import 'package:nsh7nha/models/user_model.dart';
import 'package:nsh7nha/screens/auth/views/login/login_cubit/login_states.dart';

import '../../../../../components/helper/api.dart';
import '../../../../../constants.dart';

class StoreLoginCubit extends Cubit<StoreLoginStates> {
  StoreLoginCubit() : super(StoreLoginInitialState());
  // make an object from this cubit to use it
  static StoreLoginCubit get(context) => BlocProvider.of(context);

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(StoreLoginLoadingState());
    try {
      Response response = await Api().post(path: '$baseUrl/api/login', data: {
        'email': email,
        'password': password,
      });
      // print(response.data);
      StoreUserModel loginModel = StoreUserModel.fromJson(response.data);
      emit(StoreLoginSuccessState(loginModel));
      SecureStorage().setToken(token: loginModel.token);
    } catch (e) {
      if (e is DioException) {
        // Check if the error has a response and handle it
        if (e.response != null) {
          final errorMessage = e.response?.data['message'] ?? 'Unknown error';
          emit(StoreLoginErrorState(error: errorMessage));
        } else {
          // Handle cases where there's no response (e.g., network error)
          emit(StoreLoginErrorState(error: e.message!));
        }
      } else {
        emit(StoreLoginErrorState(error: e.toString()));
      }
    }
  }

  bool isPassword = true;

  void togglePasswordIcon() {
    isPassword = !isPassword;
    emit(StoreLoginTogglePasswordState());
  }
}
