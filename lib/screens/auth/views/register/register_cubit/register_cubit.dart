import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/components/helper/secure_storage.dart';
import 'package:nsh7nha/screens/auth/views/register/register_cubit/register_states.dart';

import '../../../../../components/helper/api.dart';
import '../../../../../constants.dart';
import '../../../../../models/user_model.dart';

class StoreRegisterCubit extends Cubit<StoreRegisterStates> {
  StoreRegisterCubit() : super(StoreRegisterInitialState());
  // make an object from this cubit to use it
  static StoreRegisterCubit get(context) => BlocProvider.of(context);

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(StoreRegisterLoadingState());
    try {
      Response response =
          await Api().post(path: '$baseUrl/api/register', data: {
        'email': email,
        'password': password,
        'name': name,
      });
      // print(response.data);
      StoreUserModel registerModel = StoreUserModel.fromJson(response.data);
      emit(StoreRegisterSuccessState(registerModel));
      SecureStorage().setToken(token: registerModel.token);
    } catch (e) {
      if (e is DioException) {
        // Check if the error has a response and handle it
        if (e.response != null) {
          final errorMessage = e.response?.data['message'] ?? 'Unknown error';
          emit(StoreRegisterErrorState(error: errorMessage));
        } else {
          // Handle cases where there's no response (e.g., network error)
          emit(StoreRegisterErrorState(error: e.message!));
        }
      } else {
        emit(StoreRegisterErrorState(error: e.toString()));
      }
    }
  }

  void sendEmailVerification({required String email}) async {
    try {
      Response response = await Api().post(
        path: '$baseUrl/api/email/verification/create',
        data: {
          'email': email,
        },
      );
      print(response.data);
      emit(StoreRegisterEmailVerificationSuccessState());
    } catch (e) {
      print(e.toString());
      emit(StoreRegisterEmailVerificationErrorState());
    }
  }

  bool isPassword = true;

  void togglePasswordIcon() {
    isPassword = !isPassword;
    emit(StoreRegisterTogglePasswordState());
  }

  //
  // Future<void> matchEmailOtp({
  //   required String otpCode,
  // }) async {
  //   emit(StoreRegisterEmailVerificationLoadingState());
  //   try {
  //     Response response =
  //         await Api().post(path: '$baseUrl/api/register', data: {
  //       'email': email,
  //       'password': password,
  //       'name': name,
  //     });
  //     // print(response.data);
  //     StoreUserModel registerModel = StoreUserModel.fromJson(response.data);
  //     emit(StoreRegisterSuccessState(registerModel));
  //     SecureStorage().setToken(token: registerModel.token);
  //   } catch (e) {
  //     if (e is DioException) {
  //       // Check if the error has a response and handle it
  //       if (e.response != null) {
  //         final errorMessage = e.response?.data['message'] ?? 'Unknown error';
  //         emit(StoreRegisterErrorState(error: errorMessage));
  //       } else {
  //         // Handle cases where there's no response (e.g., network error)
  //         emit(StoreRegisterErrorState(error: e.message!));
  //       }
  //     } else {
  //       emit(StoreRegisterErrorState(error: e.toString()));
  //     }
  //   }
  // }
}
