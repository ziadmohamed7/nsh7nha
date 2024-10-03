import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/screens/auth/views/email_verfication/emailVerification_cubit/email_verification_states.dart';

import '../../../../../components/helper/api.dart';
import '../../../../../constants.dart';

class StoreEmailVerificationCubit extends Cubit<StoreEmailVerificationStates> {
  StoreEmailVerificationCubit() : super(StoreEmailVerificationInitialState());
  // make an object from this cubit to use it
  static StoreEmailVerificationCubit get(context) => BlocProvider.of(context);

  String otpCode = '';
  void setOtpCode({required String value}) {
    otpCode = value;
    emit(StoreEmailVerificationChangeOtpState());
  }

  bool isEnabled = false;
  void changeButtonEnable() {
    isEnabled = true;
    emit(StoreEmailVerificationButtonEnabledState());
  }

  //
  Future<void> matchEmailOtp({
    required String otpCode,
    required String email,
  }) async {
    emit(StoreEmailVerificationLoadingState());
    try {
      Response response = await Api()
          .post(path: '$baseUrl/api/email/verification/store', data: {
        'email': email,
        'otp': otpCode,
      });
      emit(StoreEmailVerificationSuccessState(response.data['message']));
    } catch (e) {
      print(e.toString());
      emit(StoreEmailVerificationErrorState(error: e.toString()));
    }
  }
}
